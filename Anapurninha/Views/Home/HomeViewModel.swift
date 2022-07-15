//
//  HomeViewModel.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/4/22.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    private var selectedRating: RatingType = .wow
    
    @Published var meals: [Meal] = []
    @Published var ratings: [RatingVM] = []
    @Published var alertItem: AlertItem?
    
    init() {
        setup()
    }
    
    private func setup() {
        setRatings()
        loadMeals()
    }
    
    private func loadMeals() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let todayString = dateFormatter.string(from: Date())
        API<[Meal]>.todayMeal.request(params: ["todayDate": todayString]) { [weak self] result in
            switch result {
            case .success(let meals):
                self?.meals = meals
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setRatings() {
        ratings = [RatingVM(rating: .wow,
                            isSelect: selectedRating == .wow,
                            isSelected: selectRating(.wow)),
                   RatingVM(rating: .good,
                            isSelect: selectedRating == .good,
                            isSelected: selectRating(.good)),
                   RatingVM(rating: .bad,
                            isSelect: selectedRating == .bad,
                            isSelected: selectRating(.bad))]
    }
    
    private func selectRating(_ type: RatingType) -> () -> Void {
        return { [weak self] in
            self?.selectedRating = type
            self?.setRatings()
        }
    }
    
    func rate() {
        guard let type = (meals.first { $0.onTime })?.type else { return }
        let id: Int
        switch type {
        case .breakfast: id = 1
        case .lunch: id = 2
        case .dinner: id = 3
        case .none: return
        }
        let params: JSON = ["dailyMealId": id,
                            "userId": 2,
                            "rating": selectedRating.title]
        API<EmptyResult>.addRating.request(params: params) { [weak self] result in
            switch result {
            case .success: self?.alertItem = AlertContext.rateSuccess
            case .failure: self?.alertItem = AlertContext.rateFail
            }
        }
    }
}
