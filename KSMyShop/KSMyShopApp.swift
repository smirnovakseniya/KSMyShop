//
//  KSMyShopApp.swift
//  KSMyShop
//
//  Created by Kseniya Smirnova on 3.11.22.
//

import SwiftUI

@main
struct KSMyShopApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
                .environmentObject(Model())
        }
    }
}
