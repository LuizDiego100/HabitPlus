//
//  SignUpViewModel.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 22/06/2022.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    
    var publisher: PassthroughSubject<Bool, Never>!
    
    @Published var uiState: SignUPUIState = .none
    
    func signUp() {
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: . now() + 1) {
//            self.uiState = .error("Usuario já Existente")
            self.uiState = .success
            self.publisher.send(true)
        }
    }
    
}

extension SignInViewModel {
    func HomeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
}