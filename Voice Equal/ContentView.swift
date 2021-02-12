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
        VStack {
            Text("NUMBER OF PEOPLE")
            HStack{
                HStack{
                Text("WOMEN:")
                TextField(
                    "",
                    value: $womenCount,
                    formatter: NumberFormatter()
                ).background(Color.gray).padding(.leading , 10).padding(.trailing, 10).fixedSize(horizontal: true, vertical: false)
                }
                Spacer()
                Divider().fixedSize(horizontal: true, vertical: true)
                Spacer()
                HStack{
                Text("MEN:")
                TextField(
                    "",
                    value: $menCount,
                    formatter: NumberFormatter()
                ).background(Color.gray).padding(.leading , 10).padding(.trailing, 10).fixedSize(horizontal: true, vertical: false)
                }
            }
            Button(action: {
                print("Clicked on Button")
            }) {
                Image(systemName: "trash")
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
