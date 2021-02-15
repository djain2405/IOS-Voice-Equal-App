//
//  ContentView.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var resultView = false

    var body: some View {
        if(!self.resultView) {
            return
                AnyView(VStack{
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
                Button(action: {
                    withAnimation{
                        self.resultView.toggle()
                    }
                    print("See Result!")
                }, label: {
                    Text("See Result")
                })
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            .background(Color("background"))
            .ignoresSafeArea())
        } else {
            return AnyView(ResultView())
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
