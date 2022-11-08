//
//  Card.swift
//  KSMyShop
//
//  Created by Kseniya Smirnova on 7.11.22.
//

import Foundation

struct Card: Identifiable {
    let id = UUID()
    let card: NameCards.RawValue
    let image: [String]
    let name: String
    let raiting: Int
    let color: Colors.RawValue
    let description: String
    var buy: Bool
}
