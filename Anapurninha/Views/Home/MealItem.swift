//
//  MealItem.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/4/22.
//

import SwiftUI

struct MealItem: View {
    var meal: Meal
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text(meal.icon)
                .font(Font.custom("Poppins-Regular", size: 36))
                .frame(width: 60, height: 60)
                .background(Color.white)
                .cornerRadius(30)
            Text(meal.type.rawValue.capitalized)
                .foregroundColor(meal.onTime ? .white : .black)
                .font(Font.custom("Poppins-Regular", size: 16))
                .fontWeight(.bold)
        }
        .frame(width: 118, height: 150)
        .padding(16)
        .background(meal.onTime ? .indigo : .white)
        .overlay(RoundedRectangle(cornerRadius: 35)
            .stroke(meal.onTime ? .black : .gray.opacity(0.2), lineWidth: 2))
        .cornerRadius(35)
        .padding(8)
    }
}

struct MealItem_Previews: PreviewProvider {
    static var previews: some View {
        MealItem(meal: HomeViewModel().meals[0])
    }
}
