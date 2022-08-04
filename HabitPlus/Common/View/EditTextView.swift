//
//  EditTextView.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 23/06/2022.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct EditTextView: View {
    
    @Binding var text: String
    
    var placeholder: String = ""
    var keyboard: UIKeyboardType = .default
    var error: String? = nil
    var failure: Bool? = nil
    var isSecure: Bool = false
    
    var body: some View {
        VStack {
            if isSecure {
                SecureField(placeholder, text: $text)
                        .foregroundColor(Color("textColor"))
                        .keyboardType(keyboard)
                        .textFieldStyle(CustomTextFieldStyle())
            } else {
        TextField(placeholder, text: $text)
                .foregroundColor(Color("textColor"))
                .keyboardType(keyboard)
                .textFieldStyle(CustomTextFieldStyle())
            }
            
            if let error = error, failure == true, !text.isEmpty {
                Text(error).foregroundColor(.red)
            }
        }
        .padding(.bottom, 10)
        
    }
}

struct EditTextView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            VStack {
                EditTextView(text: .constant("Texto"),
                             placeholder: "E-mail",
                             error: "Campo Inválido",
                             failure: "a@a.com".count < 3)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .previewDevice("iPhone 13")
            .preferredColorScheme($0)
        }
    }
}
