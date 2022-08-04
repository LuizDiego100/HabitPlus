//
//  SignInErrorResponse.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 04/08/2022.
//

import Foundation

struct SignInErrorResponse: Decodable {
  
  let detail: SignInDetailErrorResponse
  
  enum CodingKeys: String, CodingKey {
    case detail
  }
  
}

struct SignInDetailErrorResponse: Decodable {
  
  let message: String
  
  enum CodingKeys: String, CodingKey {
    case message
  }
  
}
