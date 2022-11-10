//
//  KSMyShopWidget.swift
//  KSMyShopWidget
//
//  Created by Kseniya Smirnova on 8.11.22.
//

import WidgetKit
import SwiftUI
import Intents

let placeholderCard = Model().widgetCard
let model = Model()
var modelArray: [Card] = []

struct Provider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), card: placeholderCard)
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, card: placeholderCard)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let modelArray = createAllModelArray()
        let date = Date()

        entries.append(SimpleEntry(date: date, configuration: ConfigurationIntent(),
                                   card: modelArray[Int.random(in: 0..<modelArray.count)]))
        
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}


private func createAllModelArray() -> [Card] {
    for i in model.dinoCards {
        for (j, _) in i.image.enumerated() {
            modelArray.append(Card(card: i.card, image: [i.image[j]], name: i.name, raiting: i.raiting, color: i.color, description: i.description, buy: i.buy))
        }
    }
    for i in model.leoCards {
        for (j, _) in i.image.enumerated() {
            modelArray.append(Card(card: i.card, image: [i.image[j]], name: i.name, raiting: i.raiting, color: i.color, description: i.description, buy: i.buy))
        }
    }
    for i in model.horseCards {
        for (j, _) in i.image.enumerated() {
            modelArray.append(Card(card: i.card, image: [i.image[j]], name: i.name, raiting: i.raiting, color: i.color, description: i.description, buy: i.buy))
        }
    }
    return modelArray
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let card: Card
}

struct KSMyShopWidgetEntryView: View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        
        switch family {
        case .systemSmall:
            WidgetSystemSquareView(card: entry.card, family: .systemSmall)
        case .systemLarge:
            WidgetSystemSquareView(card: entry.card, family: .systemLarge)
        case .systemMedium: // узкая
            WidgetSystemMediumView(card: entry.card)
        default:
            WidgetSystemSquareView(card: entry.card, family: .systemSmall)
        }
    }
}

@main
struct KSMyShopWidget: Widget {
    
    let kind: String = "KSMyShopWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            KSMyShopWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemLarge, .systemMedium])
    }
    
    
}

struct KSMyShopWidget_Previews: PreviewProvider {
    static var previews: some View {
        KSMyShopWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), card: placeholderCard))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
