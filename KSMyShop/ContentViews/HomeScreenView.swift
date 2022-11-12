//
//  HomeScreenView.swift
//  KSMyShop
//
//  Created by Kseniya Smirnova on 3.11.22.
//

import SwiftUI
import WidgetKit

struct HomeScreenView: View {
    
    let categories: [Stars] = [Stars.all, Stars.one, Stars.two, Stars.three, Stars.four, Stars.five]
    
    @State var selectedIndex: Int = 0
    @State var showingPopup = false
    @State var isEmptyCard = 0
   
    @ObservedObject var user = User()
    
    @EnvironmentObject var model: Model
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color("BGColor"), .white], startPoint: .bottom, endPoint: .top)
                    .edgesIgnoringSafeArea(.all)
                
                VStack() {
                    StatusBarView(action: {
                        showingPopup = true
                    }, name: user.name)
                    
                    HStack {
                        Text("Raiting").customTitleText()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack() {
                                ForEach(0..<categories.count, id: \.self) { i in
                                    CategoryView(isActive: i == selectedIndex, text: categories[i].rawValue)
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                            .padding()
                        }
                    }
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            CardsListView(array: model.dinoCards, name: "Dino", selectedRaiting: selectedIndex)
                            CardsListView(array: model.leoCards, name: "Leo", selectedRaiting: selectedIndex)
                            CardsListView(array: model.horseCards, name: "Horse", selectedRaiting: selectedIndex)
                        }
                    }
                }
      
            }
            
            .popup(isPresented: $showingPopup, view: {
                Color.black.opacity(0.6)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            }, userName: $user.name)
            
            
        }
        .onAppear {
            if let value = UserDefaults.standard.value(forKey: "userName") as? String {
                user.name = value
            }
        }
    }
    
private struct StatusBarView: View {
        let action: () -> Void
        var name: String
        
        var body: some View {
            HStack {
                Button(action: action) {
                    Image(uiImage: UIImage(named: "Avatar")!)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                }
                TitleTextView(name: name)
                    .padding()
            }
            .padding(.horizontal)
        }
    }
}

private struct TitleTextView: View {
    var name: String
    
    var body: some View {
        Text("Hello, ")
            .font(.title2)
            .foregroundColor(Color("TitleColor"))
        + Text(name + "!")
            .font(.title).bold()
            .foregroundColor(Color("TitleColor"))
    }
}

private struct CategoryView: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
            VStack {
                Text(text)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(isActive ? Color("BGColor") : .black.opacity(0.5))
            }
            .padding(.trailing)
    }
}

private struct CardsListView: View {
    let array: [Card]
    var name: String
    var selectedRaiting: Int
  
    var body: some View {
        if (array.first{ $0.raiting == selectedRaiting } != nil) || selectedRaiting == 0 {
            Text(name).customTitleText()
        }
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<array.count, id: \.self) { i in
                    if array[i].raiting == selectedRaiting || selectedRaiting == 0 {
                        NavigationLink(
                            destination: CardScreenView(card: array[i], index: i),
                            label: {
                                CardView(card: array[i], size: 200)
                            })
                    }
                }
                .padding(.trailing)
            }
            .padding(.horizontal)
        }
    }
}

private struct CardView: View {
    let card: Card
    let size: CGFloat
    
    var body: some View {
            VStack {
                Image(card.image[0])
                    .resizable()
                    .frame(width: size, height: size)
                    .cornerRadius(20)
                HStack {
                    Text(card.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(3)
                        .foregroundColor(.black)
                    if card.buy {
                        Image(systemName: "cart.fill")
                            .foregroundColor(Color("TitleColor"))
                    }
                }
                RaitingStarsView(raiting: card.raiting)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
            
    }
}
