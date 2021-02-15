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
            Text("VOICE EQUAL")
                .font(.headline)
                .padding(.horizontal)
                .padding(.top, 32)
                .padding(.bottom, 32)
            CounterView()
                .padding()
                .border(Color.gray)
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(Color("background"))
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
