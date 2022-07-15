//
//  MealList.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/4/22.
//

import SwiftUI

struct MealList: View {
    
    var meal: Meal
    
    var body: some View {
        VStack() {
            Text("Main Foods")
                .font(Font.custom("Poppins-Bold", size: 18))
            List(meal.meals.main) {
                Text($0.name)
                    .font(Font.custom("Poppins-Regular", size: 16))
            }
            Text("Fruits")
                .font(Font.custom("Poppins-Bold", size: 18))
            List(meal.meals.fruits) {
                Text($0.name)
                    .font(Font.custom("Poppins-Regular", size: 16))
            }
            Text("Desserts")
                .font(Font.custom("Poppins-Bold", size: 18))
            List(meal.meals.dessert) {
                Text($0.name)
                    .font(Font.custom("Poppins-Regular", size: 16))
            }
        }
        .navigationTitle(Text(meal.type.rawValue.capitalized))
    }
}

struct MealList_Previews: PreviewProvider {
    static var previews: some View {
        MealList(meal: HomeViewModel().meals[0])
    }
}
