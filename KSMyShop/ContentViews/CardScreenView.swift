//
//  CardScreenView.swift
//  KSMyShop
//
//  Created by Kseniya Smirnova on 4.11.22.
//

import SwiftUI

struct CardScreenView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var card: Card = Card(card: "", image: [], name: "", raiting: 0, color: "", description: "", buy: false)
    @State var index: Int = 0
    
    @EnvironmentObject var model: Model
    
    var body: some View {
        NavigationView {
            VStack() {
                ZStack(alignment: .topLeading) {
                    TabView {
                        ForEach(0..<card.image.count, id: \.self) { i in
                            Image(card.image[i]).customImage()
                                .edgesIgnoringSafeArea(.top)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    
                    CircleButtonView(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, image: Image(systemName: "chevron.backward"))
                }
                .edgesIgnoringSafeArea(.top)
                
                VStack(alignment: .leading) {
                    Text(card.name)
                        .padding(.horizontal)
                        .font(.system(size: 30, weight: .bold))
                    RaitingStarsView(raiting: card.raiting)
                        .padding(.horizontal)
                        .padding(.vertical, 3)
                    Text("Description").customTitleText()
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack() {
                            Text(card.description).customTextDescription()
                        }
                        .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .padding(.bottom)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(card.color))
                if !card.buy {
                    Button(action: {
                        card.buy.toggle()
                        switch card.card {
                        case NameCards.dino.rawValue:
                            model.dinoCards[index].buy.toggle()
                        case NameCards.leo.rawValue:
                            model.leoCards[index].buy.toggle()
                        case NameCards.horse.rawValue:
                            model.horseCards[index].buy.toggle()
                        default:
                            break
                        }
                    }) {
                        HStack {
                            Text("Buy").bold().font(.title2).foregroundColor(Color("TitleColor"))
                            Image(systemName: "cart")
                                .background(Color.white)
                                .foregroundColor(Color("TitleColor"))
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .frame(height: 40)
                } else {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 40)
                        .foregroundColor(Color("TitleColor"))
                }
                
            }
            .background(Color(card.color))
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

private struct CircleButtonView: View {
    let action: () -> Void
    let image: Image
    
    var body: some View {
        Button(action: action) {
            image
                .background(Color.white)
                .foregroundColor(Color("TitleColor"))
        }
        .padding()
        .background(Color.white)
        .clipShape(Circle())
        .padding(.horizontal)
        .frame(width: 30, height: 30)
        .offset(x: 30, y: 60)
    }
}

struct CardScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CardScreenView()
    }
}
