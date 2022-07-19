//
//  splashviewmodel.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 20/06/2022.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: splashUIState = .loading
    
    func onAppear() {
        //faz algo ssincrono e mud o estado
        
 DispatchQueue.main.asyncAfter(deadline: . now() + 3) {
            // aqui é chamado de 2 segundos
//	self.uiState = .goToSignInScreen
     self.uiState = .goToSignInScreen
        }
    }
	
}

extension SplashViewModel {
    func signInView() -> some View {
        return SplashViewRouter.makeSignInView()
    }
}
