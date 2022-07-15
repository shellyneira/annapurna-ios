//
//  MainButton.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/4/22.
//

import SwiftUI

struct MainButton: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Font.custom("Poppins-Bold", size: 12))
                .textCase(.uppercase)
                .foregroundColor(.indigo)
                .frame(maxWidth: .infinity)
                .frame(height: 47)
        }
        .overlay(RoundedRectangle(cornerRadius: 40).stroke(lineWidth: 0))
        .background(Color.white).cornerRadius(40)
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(title: "Do something", action: {})
    }
}
