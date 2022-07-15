//
//  Meal.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/4/22.
//

import Foundation
import SwiftUI

struct Meals: Codable {
    var fruits: [Food]
    var main: [Food]
    var dessert: [Food]
    var soups: [Food]?
}

enum MealType: String {
    case breakfast
    case lunch
    case dinner
    case none
}

struct Meal: Codable, Identifiable {
    
    var id: Int {
        return UUID.init().hashValue
    }
    private var category: String
    var countryInspired: String?
    var meals: Meals
    
    var type: MealType {
        return MealType(rawValue: category.lowercased()) ?? .none
    }
    
    var icon: String {
        switch type {
        case .breakfast: return "🥞"
        case .lunch: return "🌮"
        case .dinner: return "🍔"
        case .none: return ""
        }
    }
    
    var onTime: Bool {
        let hour = Calendar.current.component(.hour, from: Date())
        switch type {
        case .breakfast: return hour >= 8 && hour < 12
        case .lunch: return hour >= 12 && hour < 18
        case .dinner: return hour >= 18 || hour < 8
        case .none: return false
        }
    }
}

struct Food: Codable, Identifiable {
    
    var id: Int
    var name: String
    var description: String?
    var containsGluten: Bool?
    var containsSugar: Bool?
    var containsDairy: Bool?
}
