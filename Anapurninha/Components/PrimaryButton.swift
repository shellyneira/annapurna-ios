//
//  PrimaryButton.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/13/22.
//

import SwiftUI

struct PrimaryButton: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.poppinsSB(size: 16))
                .textCase(.lowercase)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 47)
        }
        .overlay(RoundedRectangle(cornerRadius: 40).stroke(lineWidth: 0))
        .background(.indigo).cornerRadius(40)
    }
}
