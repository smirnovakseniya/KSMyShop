//
//  ContentView.swift
//  KSMyShop
//
//  Created by Kseniya Smirnova on 3.11.22.
//

import SwiftUI

public struct Popup<PopupContent>: ViewModifier where PopupContent: View {
    
    init(isPresented: Binding<Bool>, view: @escaping () -> PopupContent, userName: Binding<String>) {
        self._isPresented = isPresented
        self.view = view
        self._userName = userName
    }
    
    var view: () -> PopupContent

    @Binding var isPresented: Bool
    @Binding var userName: String
    
    @State private var presenterContentRect: CGRect = .zero
    @State private var sheetContentRect: CGRect = .zero
    
    @FocusState private var nameIsFocused: Bool
    
    private var displayedOffset: CGFloat {
        -presenterContentRect.midY + screenHeight/2
    }
    
    private var hiddenOffset: CGFloat {
        if presenterContentRect.isEmpty {
            return 1000
        }
        return screenHeight - presenterContentRect.midY + sheetContentRect.height/2 + 5
    }
    
    private var currentOffset: CGFloat {
        return isPresented ? displayedOffset : hiddenOffset
    }
    
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    private var screenHeight: CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
                .frameGetter($presenterContentRect)
        }
        .overlay(sheet())
        
    }
    
    func sheet() -> some View {
        ZStack {
            self.view()
                .overlay(content: {
                    LinearGradient(colors: [Color("BGColor"), .white], startPoint: .top, endPoint: .bottom)
                        .frame(width: 300, height: 200)
                        .cornerRadius(20)
                    
                    VStack {
                        Text("Enter Your Name:").bold()
                        
                        TextField("Name", text: $userName)
                            .padding()
                            .frame(width: 250, height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .focused($nameIsFocused)
                            
                        Button(action: {
                            nameIsFocused = false
                            UserDefaults.standard.setValue(userName, forKey: "userName")
                            dismiss()
                        }) {
                            Text("Save")
                                .padding()
                                .frame(width: 250)
                                .background(Color("BGColor"))
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        }
                } 
                })
                .frameGetter($sheetContentRect)
                .frame(width: screenWidth)
                .offset(x: 0, y: currentOffset)
                .animation(Animation.easeOut(duration: 0.3), value: currentOffset)
        }
    }
    
    func dismiss() {
        isPresented = false
    }
}

struct FrameGetter: ViewModifier {
  
    @Binding var frame: CGRect
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy -> AnyView in
                    let rect = proxy.frame(in: .global)
                    if rect.integral != self.frame.integral {
                        DispatchQueue.main.async {
                            self.frame = rect
                        }
                       }
                return AnyView(EmptyView())
            })
    }
}

extension View {
    func frameGetter(_ frame: Binding<CGRect>) -> some View {
        modifier(FrameGetter(frame: frame))
    }
}

extension View {
    public func popup<PopupContent: View> (isPresented: Binding<Bool>, view: @escaping () -> PopupContent, userName: Binding<String>) -> some View {
        self.modifier(
            Popup(
                isPresented: isPresented,
                view: view,
                userName: userName)
        )
    }
}
