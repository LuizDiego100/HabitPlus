//
//  RefreshRequest.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 30/08/2022.
//

import Foundation

struct RefreshRequest: Encodable {
  
  let token: String
  
  enum CodingKeys: String, CodingKey {
    case token = "refresh_token"
  }
}
