//
//  SignUpUIState.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 22/06/2022.
//

import Foundation

enum SignUPUIState: Equatable {
    case none
    case loading
    case success
    case error(String)
}
