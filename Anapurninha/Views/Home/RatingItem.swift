//
//  RatingItem.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/4/22.
//

import SwiftUI

enum RatingType {
    case wow, good, bad
    
    var title: String {
        switch self {
        case .wow: return "WOW!"
        case .good: return "GOOD..."
        case .bad: return "NAH..."
        }
    }
    
    var icon: String {
        switch self {
        case .wow: return "😍"
        case .good: return "🙂"
        case .bad: return "😕"
        }
    }
}

struct RatingVM: Identifiable {
    
    var id = UUID.init().hashValue
    
    var rating: RatingType
    var isSelect: Bool
    var isSelected: () -> Void
}

struct RatingItem: View {
    
    var viewModel: RatingVM
    
    var body: some View {
        HStack {
            Text(viewModel.rating.icon)
                .font(.title)
                .frame(width: 40, height: 40)
                .background(Color.white)
                .cornerRadius(30)
            Text(viewModel.rating.title)
                .foregroundColor(viewModel.isSelect ? .white : .black)
                .font(Font.custom("Poppins-Bold", size: 16))
        }
        .frame(width: 120, height: 52)
        .padding(8)
        .background(viewModel.isSelect ? .indigo : .white)
        .overlay(RoundedRectangle(cornerRadius: 35)
            .stroke(viewModel.isSelect ? .black : .gray.opacity(0.2), lineWidth: 2))
        .cornerRadius(35)
        .padding(8)
    }
}

struct RatingItem_Previews: PreviewProvider {
    static var previews: some View {
        RatingItem(viewModel: RatingVM(rating: .wow, isSelect: false, isSelected: {}))
    }
}
