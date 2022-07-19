//
//  signInUIState.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 21/06/2022.
//

import Foundation

enum signInUIState: Equatable {
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
