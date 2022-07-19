//
//  SignUpView.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 21/06/2022.
//

import SwiftUI

struct SignUpView: View {
    
    //nome completo
    //email
    //senha
    //nif
    //telefone
    //data de nascimento
    //genero
    
    @State var fullName = ""
    @State var email = ""
    @State var password = ""
    @State var document = ""
    @State var phone = ""
    @State var birthday = ""
    @State var gender = Gender.male
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
            
            VStack(alignment: .center) {
                
                VStack(alignment: .leading, spacing: 8) {
                
                Text("Cadastro")
                    .foregroundColor(Color("textColor"))
                    .font(Font.system(.title).bold())
                    .padding(.bottom, 8)
                
                fullNameField
                
                emailField
                    
                passwordField
                
                documentField
                
                phoneField
                
                birthdayField
                    
                genderField
                    
                saveButton
                
                }
                
                Spacer()
             }.padding(.horizontal, 8)
        
            }.padding()
            
            if case SignUPUIState.error(let value) = viewModel.uiState {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("Ok")) {
                            //faz algo quando some o alerta
                    })
                }
            }
        }
    }
}

extension SignUpView {
    var fullNameField: some View {
        EditTextView(text: $fullName,
                     placeholder: "Entre com seu nome completo *",
                     keyboard: .alphabet,
                     
                     failure: fullName.count < 3)
    }
}

extension SignUpView {
    var emailField: some View {
        EditTextView(text: $email,
                     placeholder: "Entre com seu e-mail *",
                     keyboard: .emailAddress,
                     error: "e-mail inválido",
                     failure: !email.isEmail())
    }
}

extension SignUpView {
    var passwordField: some View {
        EditTextView(text: $password,
                     placeholder: "Entre com sua senha *",
                     keyboard: .default,
                     error: "senha deve ter ao menos 8 caracteres",
                     failure: password.count < 8,
                     isSecure: true)
    }
}

extension SignUpView {
    var documentField: some View {
        EditTextView(text: $document,
                     placeholder: "Entre com seu Nif *",
                     keyboard: .numberPad,
                     error: "Nif inválido",
                     failure: document.count < 8)
        // TODO: mask
        // TODO: isDisabled
    }
}

extension SignUpView {
    var phoneField: some View {
        EditTextView(text: $document,
                     placeholder: "Entre com seu telemóvel *",
                     keyboard: .numberPad,
                     error: "Deve conter ao menos 8 dígitos",
                     failure: phone.count < 8)
        // TODO: mask
    }
}

extension SignUpView {
    var birthdayField: some View {
        EditTextView(text: $birthday,
                     placeholder: "Entre com sua data de nascimento",
                     keyboard: .default,
                     error: "Data deve ser dd/MM/yyyy",
                     failure: birthday.count != 10)
        // TODO: mask
    }
}

extension SignUpView {
    var genderField: some View {
        Picker("Gender", selection: $gender) {
            ForEach(Gender.allCases, id: \.self) { value in
                Text(value.rawValue)
                    .tag(value)
            }
        }.pickerStyle(SegmentedPickerStyle())
            .padding(.top, 16)
            .padding(.bottom, 32)
    }
}

extension SignUpView {
    var saveButton: some View {
        LoadingButtonView(action: {
          viewModel.signUp()
        },
        text: "Realize seu Cadastro",
        showProgress: self.viewModel.uiState == SignUPUIState.loading,
        disable: !email.isEmail() ||
            password.count < 8 ||
            fullName.count < 3 ||
            document.count < 8 ||
            phone.count < 8  ||
            birthday.count != 10)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            SignUpView(viewModel: SignUpViewModel())
            .previewDevice("iPhone 13")
            .preferredColorScheme($0)
        }

    }
}
