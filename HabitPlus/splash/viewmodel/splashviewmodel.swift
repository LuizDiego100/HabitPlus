//
//  splashviewmodel.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 20/06/2022.
//

import SwiftUI
import Combine

class SplashViewModel: ObservableObject {
    
    @Published var uiState: splashUIState = .loading
    
    private var cancellableAuth: AnyCancellable?
    private var cancellableRefresh: AnyCancellable?
    
    private let interactor: SplashInteractor
    
    init(interactor: SplashInteractor) {
        self.interactor = interactor
    }
    
    deinit {
        cancellableAuth?.cancel()
        cancellableRefresh?.cancel()
    }
    
    func onAppear() {
        cancellableAuth = interactor.fetchAuth()
            .delay(for: .seconds(2), scheduler: RunLoop.main)
            .receive(on: DispatchQueue.main)
            .sink { userAuth in
                // se o userauth == nulo -> login
                if userAuth == nil {
                    self.uiState = .goToSignInScreen
                }
                // senao se userauth != null && expirou
                else if (Date().timeIntervalSince1970 > Double(userAuth!.expires)) {
                // chamar o refresh token na API
                    print("Token expirou")
                    let request = RefreshRequest(token: userAuth!.refreshToken)
                    self.cancellableRefresh = self.interactor.refreshToken(refreshResquest: request)
                        .receive(on: DispatchQueue.main)
                        .sink(receiveCompletion: { completion in
                            switch(completion) {
                            case .failure(_):
                                self.uiState = .goToSignInScreen
                                break
                            default:
                                break
                            }
                        }, receiveValue: { success in
                           
                            let auth = UserAuth(idToken: success.accessToken,
                                                    refreshToken: success.refreshToken,
                                                    expires: Date().timeIntervalSince1970 + Double(success.expires),
                                                    tokenType: success.tokenType)
                                
                            self.interactor.insertAuth(userAuth: auth)
                                
                            self.uiState = .goToHomeScreen
                            
                        })
                }
                // senoa -> tela principal
                else {
                    self.uiState = .goToHomeScreen
                }
            }
    }
	
}

extension SplashViewModel {
    func signInView() -> some View {
        return SplashViewRouter.makeSignInView()
    }
}
