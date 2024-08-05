//
//  CalculatedApp.swift
//  Calculated
//
//  Created by Муртазали Магомедов on 16.05.2023.
//

import SwiftUI

@main
struct CalculatedApp: App {
    
    @StateObject var mainViewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(mainViewModel)
        }
    }
}
