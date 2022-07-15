//
//  SectionTitle.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/4/22.
//

import SwiftUI

struct SectionTitle: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(Font.custom("Poppins-Bold", size: 24))
            .padding(.leading, 15)
            .padding(.top, 5)
    }
}

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle(title: "")
    }
}
