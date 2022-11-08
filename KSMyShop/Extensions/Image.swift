//
//  Image.swift
//  KSMyShop
//
//  Created by Kseniya Smirnova on 3.11.22.
//

import SwiftUI

extension Image {
    func customImage() -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.top)
    }
}
