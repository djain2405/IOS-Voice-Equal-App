//
//  TimerView.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/15/21.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Text("WOMEN")
                    .padding(.bottom, 8)
                Text("00:00")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Button(action: {
                    print("Start Timer!")
                }, label: {
                    Text("Start Timer")
                        .foregroundColor(Color.white)
                })
                .padding(8)
                .background(Color("women"))
            }
            .padding(24)
            .cornerRadius(100)
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.gray, lineWidth: 1)
            )
            Spacer()
            VStack {
                Text("MEN")
                    .padding(.bottom, 8)
                Text("00:00")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Button(action: {
                    print("Start Timer!")
                }, label: {
                    Text("Start Timer")
                        .foregroundColor(Color.white)
                })
                .padding(8)
                .background(Color("men"))
            }
            .padding(24)
            .cornerRadius(100)
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.gray, lineWidth: 1)
            )
            Spacer()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
