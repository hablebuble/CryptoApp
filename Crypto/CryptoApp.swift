//
//  CryptoApp.swift
//  Crypto
//
//  Created by Alexey Strelnikov on 15.11.2022.
//

import SwiftUI

@main
struct CryptoApp: App {
    
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
