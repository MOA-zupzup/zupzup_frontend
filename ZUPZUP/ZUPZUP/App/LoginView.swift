//
//  LoginView.swift
//  ZUPZUP
//
//  Created by 강승우 on 1/3/25.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var loginErrorMessage: String = ""
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            // 앱 제목
            Text("로그인")
                .padding(.horizontal, 15)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 70)
            
            // 사용자 이름 입력 필드
            TextField("아이디를 입력해주세요", text: $username)
                .frame(height: 25)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal, 15)
                .padding(.top, 50)
                .autocapitalization(.none) // 이메일 입력 시 대문자 방지
                .keyboardType(.emailAddress)
            
            // 비밀번호 입력 필드
            SecureField("비밀번호를 입력해주세요", text: $password)
                .frame(height: 25)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal, 15)
            
            // 로그인 버튼
            Button(action: {
                print("로그인 버튼 눌림: \(username), \(password)")
                loginUser() // 로그인 함수 연결
            }) {
                Text("로그인")
                    .frame(height: 25)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(username.isEmpty || password.isEmpty ? Color.gray : Color.black)
                    .cornerRadius(8)
                    .padding(.horizontal, 15)
                    .padding(.top, 25)
            }
            .disabled(username.isEmpty || password.isEmpty)
            
            // 로그인 에러 메시지 표시
            if !loginErrorMessage.isEmpty {
                Text(loginErrorMessage)
                    .foregroundColor(.red)
                    .padding(.horizontal, 15)
                    .padding(.top, 10)
            }
            
            // 아이디 및 비밀번호 찾기
            HStack(alignment: .center, spacing: 10) {
                Spacer()
                Text("아이디 찾기")
                    .foregroundColor(Color.gray)
                    .padding(.horizontal, 10)
                Divider()
                    .frame(width: 1, height: 20)
                    .background(Color.gray)
                Text("비밀번호 찾기")
                    .foregroundColor(Color.gray)
                    .padding(.horizontal, 10)
                Spacer()
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
        .ignoresSafeArea(.keyboard) // 키보드 충돌 방지
    }
    
    func loginUser() {
        Auth.auth().signIn(withEmail: username, password: password) { authResult, error in
            if let error = error {
                // 로그인 실패 메시지 출력
                loginErrorMessage = "로그인 실패! \(error.localizedDescription)"
                print(loginErrorMessage)
            } else {
                // 로그인 성공 메시지 출력
                loginErrorMessage = ""
                print("로그인 성공!")
            }
        }
    }
}

#Preview {
    LoginView()
}
