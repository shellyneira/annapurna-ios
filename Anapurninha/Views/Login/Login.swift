//
//  Login.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/4/22.
//

import SwiftUI

struct Login: View {
    
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        if viewModel.goToHome {
            Home().environmentObject(HomeViewModel())
        } else {
            VStack(spacing: 64) {
                Text("Let’s get started")
                    .foregroundColor(.white)
                    .font(Font.custom("Poppins-Bold", size: 28))
                VStack(spacing: 16) {
                    Input(title: "Username or email", text: $viewModel.username, type: .email)
                    Input(title: "Passw*rd", text: $viewModel.password, type: .password)
                }
                MainButton(title: "Go to your account ✨") {
                    viewModel.login()
                }
                Button {
                    viewModel.createAccount()
                } label: {
                    Text("Can't login?")
                        .font(Font.custom("Poppins-Regular", size: 14))
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Spacer()
                VStack {
                    Image("grape")
                        .resizable()
                        .scaledToFit().frame(width: 200)
                }
            }
            .padding(16)
            .background() {
                Image("mesh2")
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.5)
            }
            .background(Color.indigo)
        }
    }
}

//struct Login_Previews: PreviewProvider {
//    static var previews: some View {
//        Login()
//    }
//}
