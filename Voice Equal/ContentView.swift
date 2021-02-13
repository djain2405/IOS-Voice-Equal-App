//
//  ContentView.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/11/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack{
            Text("DUAL TIMER").padding(10)
            CountView().body.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .border(Color.gray)
                .background(Color.yellow)
            Spacer()
        }.padding(24)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
