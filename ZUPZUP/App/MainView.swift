//
//  MainView.swift
//  ZUPZUP
//
//  Created by 강승우 on 1/3/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      
      TabView {
        Text("The First Tab")
          .tabItem { Image(systemName: "house") }
      }
    }
}

#Preview {
    MainView()
}
