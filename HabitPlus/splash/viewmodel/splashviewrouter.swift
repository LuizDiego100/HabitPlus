//
//  splashviewrouter.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 20/06/2022.
//

import SwiftUI

enum SplashViewRouter {
    
    static func makeSignInView() -> some View {
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
    
}
