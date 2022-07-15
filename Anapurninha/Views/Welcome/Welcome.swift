//
//  Welcome.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/5/22.
//

import SwiftUI

struct Welcome: View {
    
    @EnvironmentObject var viewModel: WelcomeViewModel
    @State private var presentedLogin = false
    
    var body: some View {
        if !presentedLogin {
            VStack(spacing: 64) {
                Text("How’s the food today?")
                    .foregroundColor(.white)
                    .font(Font.custom("Poppins-Bold", size: 28))
                
                Spacer()
                
                VStack{
                    Text("We’re here to listen to you!")
                        .foregroundColor(.white)
                        .font(Font.custom("Poppins-Regular", size: 14))
                    MainButton(title: "Get started ✨") {
                        presentedLogin = true
                    }
                }
            }
            .padding(16)
            .background(){
                Image("six")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
            }
            .background(Color("Indigo"))
        } else {
            Login()
        }
    }
}

//struct Welcome_Previews: PreviewProvider {
//    static var previews: some View {
//        Welcome()
//    }
//}
