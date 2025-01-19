//
//  MessageModel.swift
//  ZUPZUP
//
//  Created by 강승우 on 1/6/25.
//

import Foundation

struct Message: Codable, Identifiable {
  let id: Int
  let sender: String
  let receiver: String
  let title: String
  let text: String
}
