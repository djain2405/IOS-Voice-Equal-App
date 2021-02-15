//
//  ContentView.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var womenCount: Int = 0
    @State private var menCount: Int = 0


    var body: some View {
        
        VStack{
            Text("DUAL TIMER")
                .font(.headline)
                .padding(.horizontal)
                .padding(.top, 24)
            VStack {
                Text("NUMBER OF PEOPLE")
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .padding(.bottom, 16)
                HStack{
                    HStack{
                        Text("WOMEN:")
                            .padding(8.0)
                        TextField("", value: $womenCount, formatter: NumberFormatter())
                            .frame(width: 32)
                    }
                    Spacer()
                    HStack{
                        Text("MEN:")
                            .padding(8.0)
                        TextField("", value: $menCount, formatter: NumberFormatter()).frame(width: 32)
                    }
                }
                Button(action: {
                    print("clicked the button")
                }) {
                    Image(systemName: "pencil.circle")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }.padding()
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
