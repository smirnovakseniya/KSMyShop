//
//  CommonViews.swift
//  KSMyShop
//
//  Created by Kseniya Smirnova on 8.11.22.
//

import SwiftUI

struct RaitingStarsView: View {
    let raiting: Int
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<5) { i in
                Image(systemName: "star.fill")
                    .foregroundColor(i < raiting ? Color("TitleColor") : .gray.opacity(0.5))
            }
        }
    }
}
