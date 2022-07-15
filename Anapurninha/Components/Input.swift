//
//  Input.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/4/22.
//

import SwiftUI

enum InputType {
    case email, password, none
}

struct Input: View {
    
    var title: String
    @Binding var text: String
    var type: InputType = .none
    
    private var keyboardType: UIKeyboardType {
        switch type {
        case .email: return .emailAddress
        default: return .default
        }
    }
    
    var body: some View {
        Group {
            if type == .password {
                SecureField(title, text: $text)
            } else {
                TextField(title, text: $text)
            }
        }
        .keyboardType(keyboardType)
        .autocapitalization(.none)
        .font(Font.custom("Poppins-SemiBold", size: 14))
        .foregroundColor(Color("Indigo"))
        .disableAutocorrection(true)
        .frame(height: 56)
        .padding(EdgeInsets(top: 0,
                            leading: 24,
                            bottom: 0,
                            trailing: 16))
        .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(.gray.opacity(0.2), lineWidth: 1))
        .background(Color.white).cornerRadius(8)
    }
}
