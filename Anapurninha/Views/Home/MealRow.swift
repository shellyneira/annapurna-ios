//
//  MealRow.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/4/22.
//

import SwiftUI

struct MealRow: View {
    
    var categoryName: String
    var items: [Meal]

    var body: some View {
        VStack(alignment: .leading) {
            SectionTitle(title: categoryName)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { meal in
                        NavigationLink {
                            MealList(meal: meal)
                        } label: {
                            MealItem(meal: meal)
                        }
                    }
                }
            }
        }
    }
}

struct MealRow_Previews: PreviewProvider {
    
    static var previews: some View {
        MealRow(
            categoryName: "Ronaldo",
            items: HomeViewModel().meals
        )
    }
}
