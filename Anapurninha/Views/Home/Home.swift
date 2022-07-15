//
//  Home.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/4/22.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            List {
                Spacer(minLength: 34)
                    .listRowBackground(Color.background)
                MealRow(categoryName: "Today's meals", items: viewModel.meals)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    .buttonStyle(.plain)
                    .listRowBackground(Color.background)
                Spacer(minLength: 16)
                    .listRowBackground(Color.background)
                RatingRow(title: "How was the food?", items: viewModel.ratings)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    .buttonStyle(.plain)
                    .listRowBackground(Color.background)
                Spacer(minLength: 46)
                    .listRowBackground(Color.background)
                PrimaryButton(title: "send feedback!") {
                    viewModel.rate()
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.background)
            }
            .background(Color.background)
            .listStyle(.plain)
            .navigationTitle("Hello \(user_name?.capitalized ?? "User") 👋")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }.tint(.black)
            }
            .sheet(isPresented: $showingProfile) {
                ProfileView()//.environmentObject(ProfileViewModel())
            }
            .alert(item: $viewModel.alertItem) { Alert(title: $0.title,
                                                       message: $0.message,
                                                       dismissButton: $0.dismissButton) }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
