//
//  splashview.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 20/06/2022.
//

import SwiftUI

struct splashview: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group {
            switch viewModel.uiState {
            case .loading:
                loadingView()
            case .goToSignInScreen:
                //navegar p proxima tela
                viewModel.signInView()
                
            case .goToHomeScreen:
                Text("carregar tela principal")
                //navegar p proxima tela
            case .error(let msg):
                loadingView(error: msg)
            }
        }.onAppear(perform: viewModel.onAppear)
    }
    
}

extension splashview {
    func loadingView(error: String? = nil) -> some View {
    ZStack{
        Image("logoHabit")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(20)
            .ignoresSafeArea()
        
        if let error = error {
            Text("")
                .alert(isPresented: .constant(true)) {
                    Alert(title: Text("Habit"), message: Text(error), dismissButton: .default(Text("Ok")) {
                        //faz algo quando some o alerta
                    })
                }
            }
        }
    }
}

struct splashview_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
          let viewModel = SplashViewModel(interactor: SplashInteractor())
          splashview(viewModel: viewModel)
            .previewDevice("iPhone 13")
            .preferredColorScheme($0)
        }
    }
}

