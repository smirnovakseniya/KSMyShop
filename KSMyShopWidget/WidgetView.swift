//
//  WidgetView.swift
//  KSMyShop
//
//  Created by Kseniya Smirnova on 10.11.22.
//

import SwiftUI
import WidgetKit

struct WidgetSystemSquareView: View {
    var card: Card
    var family: WidgetFamily
    
    var body: some View {
        ZStack {
            Image(card.image[0]).customImage()
            VStack {
                Spacer()
                if family == .systemSmall {
                    HStack(spacing: 0) {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("TitleColor"))
                        Text(String(card.raiting)).bold()
                            .foregroundColor(Color.black)
                            .font(.system(size: 15))
                    }
                    .padding(7)
                    .background(Color(card.color).opacity(0.9))
                    .clipShape(Capsule())
                    .padding()
                } else {
                    RaitingStarsView(raiting: card.raiting)
                        .padding(7)
                        .background(Color(card.color))
                        .clipShape(Capsule())
                }
                    Text(card.name)
                        .padding(7)
                        .bold()
                        .font(family == .systemSmall ? .system(size: 15) : .system(size: 30))
                        .multilineTextAlignment(.center)
                        .background(Color(card.color).opacity(0.9))
                        .foregroundColor(Color.black)
                        .clipShape(Capsule())
                        .padding()
            }
        }
    }
}

struct WidgetSystemMediumView: View {
    var card: Card
    
    var body: some View {
        HStack {
            Image(card.image[0]).customImage()
            VStack {
                Spacer()
                HStack(spacing: 5) {
                    ForEach(0..<5) { i in
                        Image(systemName: "star.fill")
                            .foregroundColor(i < card.raiting ? Color("TitleColor") : .gray.opacity(0.5))
                    }
                }
                .padding(7)
                .background(Color(card.color))
                .clipShape(Capsule())
                Spacer()
                Text(card.name)
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.system(size: 20))
                    .padding(7)
                    .background(Color(card.color).opacity(0.9))
                    .foregroundColor(Color.black)
                    .clipShape(Capsule())
                    .frame(maxWidth: .infinity)
                Spacer()
            }
        }
    }
}
