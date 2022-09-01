//
//  ErrorResponse.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 04/08/2022.
//

import Foundation

struct ErrorResponse: Decodable {
  let detail: String
  
  enum CodingKeys: String, CodingKey {
    case detail
  }
}
