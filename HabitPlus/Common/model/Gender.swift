//
//  Gender.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 22/06/2022.
//

import Foundation


enum Gender: String, CaseIterable, Identifiable {
    case male = "Masculino"
    case female = "Feminino"
    case indefinido = "Indefinido"
    
    var id: String {
      self.rawValue
    }
    
    var index: Self.AllCases.Index {
      return Self.allCases.firstIndex { self == $0 } ?? 0
    }
    
  }
