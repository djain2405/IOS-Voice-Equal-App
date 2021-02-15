//
//  CounterView.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/14/21.
//

import SwiftUI

struct CounterView: View {
    
    @ObservedObject var userCount = SavedCount()

    
    var body: some View {
        VStack {
            Text("NUMBER OF PEOPLE")
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .padding(.bottom, 16)
            HStack{
                HStack{
                    Text("WOMEN:")
                        .padding(8.0)
                    TextField("", text: $userCount.womenCount)
                        .keyboardType(.decimalPad)
                        .frame(width: 32)
                }
                Spacer()
                HStack{
                    Text("MEN:")
                        .padding(8.0)
                    TextField("", text:$userCount.menCount )
                        .keyboardType(.decimalPad)
                        .frame(width: 32)
                }
            }
            
            Button(action: {
                // Dismiss keyboard on Save
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)

                print("Saved!")
            }, label: {
                Text("SAVE")
                    .foregroundColor(Color.white)
            })
            .padding(10)
            .background(Color("savebutton"))
            
            Button(action: {
                print("clicked the button")
            }) {
                Image(systemName: "pencil.circle")
                    .resizable()
                    .foregroundColor(Color.gray)
                    .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
