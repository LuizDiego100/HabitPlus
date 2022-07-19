//
//  SignUpViewRouter.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 22/06/2022.
//

import SwiftUI

enum SignUpViewRouter {
    
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
    
}
