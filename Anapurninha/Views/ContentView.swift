//
//  ContentView.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Home().environmentObject(HomeViewModel())
        //Login().environmentObject(LoginViewModel())
        Welcome().environmentObject(WelcomeViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
