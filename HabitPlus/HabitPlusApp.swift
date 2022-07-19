//
//  HabitPlusApp.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 20/06/2022.
//

import SwiftUI

@main
struct HabitPlusApp: App {
    var body: some Scene {
        WindowGroup {
            splashview(viewModel: SplashViewModel())
        }
    }
}
