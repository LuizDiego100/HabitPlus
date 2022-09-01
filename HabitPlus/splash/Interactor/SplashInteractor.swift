//
//  SplashInteractor.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 18/08/2022.
//

import Foundation
import Combine

class SplashInteractor {
    
    private let remote: SplashRemoteDataSource = .shared
    private let local: LocalDataSource = .shared
    
}

extension SplashInteractor {
    
    func fetchAuth() -> Future<UserAuth?, Never> {
        return local.getUserAuth()
    }
    
    func insertAuth(userAuth: UserAuth) {
        local.insertUserAuth(userAuth: userAuth)
    }
    
    func refreshToken(refreshResquest request: RefreshRequest) -> Future<SignInResponse, AppError> {
       return remote.refreshToken(request: request)
    }
    
}
