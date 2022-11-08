//
//  Text.swift
//  KSMyShop
//
//  Created by Kseniya Smirnova on 8.11.22.
//

import SwiftUI

extension Text {
    func customGrayText() -> some View {
        self.foregroundColor(.gray)
            .textCase(.uppercase)
            .font(.system(size: 14))
    }
    func customTitleText() -> some View {
        self.font(.system(size: 20, weight: .bold))
            .padding(.horizontal)
    }
    func customTextDescription() -> some View {
        self.padding(.horizontal)
            .lineSpacing(8)
            .opacity(0.6)
    }
}
