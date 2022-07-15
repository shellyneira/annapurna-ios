//
//  RatingRow.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/4/22.
//

import SwiftUI

struct RatingRow: View {
    
    var title: String
    var items: [RatingVM]
    
    var body: some View {
        VStack(alignment: .leading) {
            SectionTitle(title: title)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { viewModel in
                        Button(action: viewModel.isSelected) {
                            RatingItem(viewModel: viewModel)
                        }
                    }
                }
            }
        }
    }
}

struct RatingRow_Previews: PreviewProvider {
    static var previews: some View {
        RatingRow(title: "How was the food?", items: [])
    }
}
