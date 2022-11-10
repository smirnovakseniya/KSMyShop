//
//  KSMyShopApp.swift
//  KSMyShop
//
//  Created by Kseniya Smirnova on 3.11.22.
//

import SwiftUI
import WidgetKit

@main
struct KSMyShopApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
                .environmentObject(Model())
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                    WidgetCenter.shared.reloadTimelines(ofKind: "KSMyShopWidget")
                    }
        }
        
    }
}
