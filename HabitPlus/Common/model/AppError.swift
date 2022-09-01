//
//  AppError.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 16/08/2022.
//

import Foundation

enum AppError: Error {
    case response(message: String)
    
    public var message: String {
        switch self {
            case .response(let message):
                return message
        }
    }
}
