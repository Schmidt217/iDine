//
//  iDineApp.swift
//  iDine
//
//  Created by Michael Schmidt on 11/27/22.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
