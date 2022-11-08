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
let model = Model().dinoCards[0]

struct Provider: IntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), card: placeholderCard)
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, card: model)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
//        entries.append(SimpleEntry(date: Date(), configuration: ConfigurationIntent(), card: model))
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            if Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate) != nil {
                entries.append(SimpleEntry(date: Date(), configuration: ConfigurationIntent(), card: model))
            }
        }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    
//    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        var entries: [SimpleEntry] = []
//        let date = Date()
//        for i in 0..<Model().dinoCards.count {
//            let shaduled = date + (Double(i) * 3.0)
//            entries.append(SimpleEntry(date: shaduled, configuration: ConfigurationIntent(), card: Model().dinoCards[i]))
//        }
//        entries.append(SimpleEntry(date: Date() + Double((Model().dinoCards.count)) * 3.0 + 3.0, configuration: ConfigurationIntent(), card: Model().dinoCards[0]))
//
//        let timeline = Timeline(entries: entries, policy: .never)
//        completion(timeline)
//    }
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

private struct WidgetSystemSquareView: View {
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
                            .font(family == .systemSmall ? .system(size: 15) : .system(size: 30))
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
                
                Spacer()
                
                Text(card.name)
                    .padding(7)
                    .bold()
                    .font(family == .systemSmall ? .system(size: 15) : .system(size: 30))
                    .background(Color(card.color).opacity(0.9))
                    .foregroundColor(Color.black)
                    .clipShape(Capsule())
                    .padding()
                
                Spacer()
                
                if family == .systemLarge, card.buy {
                   
                        Image(systemName: "cart.fill")
                        .resizable()
                        .scaledToFit()
                            .frame(height: 40)
                            .foregroundColor(Color.black)
                        
                        Spacer()
                }
            }
        }
    }
}

private struct WidgetSystemMediumView: View {
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
        KSMyShopWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), card: model))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
