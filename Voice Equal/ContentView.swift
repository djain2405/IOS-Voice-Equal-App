//
//  ContentView.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var themeColor: ThemeColor = .shared
    @State var resultView = false

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        
        NavigationView {
            VStack{
                Text("VOICE EQUAL")
                    .foregroundColor(self.themeColor.textColor)
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.top, 32)
                    .padding(.bottom, 32)
                CounterView()
                TimerView()
                    .padding(.top, 32)
                Spacer()
                NavigationLink(
                    destination: ResultView(), isActive: $resultView){
                    Button(action: {
                        withAnimation{
                            self.resultView.toggle()
                        }
                        print("See Result!")
                    }, label: {
                        Text("See Result")
                            .foregroundColor(self.themeColor.textColor)
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .shadow(color: .white, radius: 10, x: -5, y: -5)
                                .shadow(color: .black, radius: 10, x: 5, y: 5)
                                .blendMode(.overlay)
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(self.themeColor.resultButton)
                        }
                    )
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)
            .padding(.bottom, 36)
            .background(self.themeColor.backgroundColor)
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
