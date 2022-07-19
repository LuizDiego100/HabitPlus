//
//  LoadingButtonView.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 27/06/2022.
//

import SwiftUI

struct LoadingButtonView: View {
    
    var action: () -> Void
    var text: String
    var showProgress: Bool = false
    var disable: Bool = false
    
    var body: some View {
        ZStack {
            Button(action: {
                action()
            }, label: {
                Text(showProgress ? " " : text)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .font(Font.system(.title3).bold())
                    .background(disable ? Color("lightOrange") : Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(4.0)
            }).disabled(disable || showProgress)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showProgress ? 1 : 0)
        }
    }
}

struct LoadingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            VStack {
                LoadingButtonView(action: {
                    print("Ola mundo")
                },
                text: "Entrar",
                showProgress: false,
                                  disable: false)
            }.padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .previewDevice("iPhone 13")
            .preferredColorScheme($0)
        }
        
    }
}
