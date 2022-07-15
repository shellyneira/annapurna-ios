//
//  AlertItem.swift
//  Anapurninha
//
//  Created by Shelly Neira on 7/13/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button
}

enum AlertContext {
    
    static let rateSuccess = AlertItem(title: Text("Nice!"),
                                       message: Text("We received your rating! :)"),
                                       dismissButton: .default(Text("Ok")))
    static let rateFail = AlertItem(title: Text("Ops!"),
                                    message: Text("We couldn't receive your rating :(\nCould you try again?"),
                                    dismissButton: .default(Text("Ok")))
}
