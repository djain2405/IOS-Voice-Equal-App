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
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.top, 32)
                    .padding(.bottom, 32)
                CounterView()
                    .padding()
                    .border(Color.gray)
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
                    })
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 24)
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
