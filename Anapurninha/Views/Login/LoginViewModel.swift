//
//  LoginViewModel.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/4/22.
//

import SwiftUI

var accessToken = ""
var user_name: String?

final class LoginViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var goToHome = false
    
    func login() {
        API<Token>.login.request(params: ["username": username, "password": password]) { [weak self] result in
            switch result {
            case .success(let token):
                accessToken = token.access_token
                user_name = self?.username
                self?.goToHome = true
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func createAccount() {
        
    }
    
    func handleLogin(){
        
    }
}



