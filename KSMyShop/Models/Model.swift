//
//  Model.swift
//  KSMyShop
//
//  Created by Kseniya Smirnova on 3.11.22.
//

import Foundation

class Model: ObservableObject {
    
    var widgetCard: Card = Card(card: "", image: ["Widget_Image"], name: "Name Toy", raiting: 5, color: Colors.lightGreen.rawValue, description: "", buy: true)
    
    @Published var dinoCards: [Card] = [
        Card(card: NameCards.dino.rawValue, image: ["Dino_1", "Dino_2"], name: "Light Olive Dino", raiting: 5, color: Colors.lightGreen.rawValue,
             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", buy: false),
        Card(card: NameCards.dino.rawValue, image: ["Dino_4", "Dino_5", "Dino_6"], name: "Dark Avocado Dino", raiting: 5, color: Colors.darkGreen.rawValue,
             description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.", buy: true),
    ]
    
    @Published var leoCards: [Card] = [
        Card(card: NameCards.leo.rawValue, image: ["Leo_1", "Leo_2", "Leo_3"], name: "Sunny Leo", raiting: 4, color: Colors.yellow.rawValue,
             description: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", buy: true),
        Card(card: NameCards.leo.rawValue, image: ["Leo_4", "Leo_5"], name: "Green Leo", raiting: 3, color: Colors.lightGreen.rawValue,
             description: "Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?", buy: false),
        Card(card: NameCards.leo.rawValue, image: ["Leo_6", "Leo_7"], name: "Mint Leo", raiting: 2, color: Colors.mint.rawValue,
             description: "t vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.", buy: false),
        Card(card: NameCards.leo.rawValue, image: ["Leo_9"], name: "Blue Leo", raiting: 4, color: Colors.blue.rawValue,
             description: "To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?", buy: false)
    ]
    
    @Published var horseCards: [Card] = [
        Card(card: NameCards.horse.rawValue, image: ["Horse_1", "Horse_2"], name: "Golden Horse", raiting: 2, color: Colors.yellow.rawValue,
             description: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",buy: true),
        Card(card: NameCards.horse.rawValue, image: ["Horse_3", "Horse_4"], name: "??aramel Horse", raiting: 1, color: Colors.lightGreen.rawValue,
             description: "Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? ",buy: false)
    ]
}
