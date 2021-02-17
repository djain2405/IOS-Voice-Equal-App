//
//  ResultView.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/15/21.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
            VStack{
               Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                VStack(alignment: .leading){
                    Text("WOMEN")
                        .bold()
                        .foregroundColor(Color("women"))
                        .padding(.bottom, 8)
                    Text("50% of speakers were women and they spoke 39% of the time")
                        .padding(.bottom, 12)
                    Text("MEN")
                            .bold()
                            .foregroundColor(Color("men"))
                            .padding(.bottom, 8)
                    Text("50% of speakers were men and they spoke 39% of the time")
                        .padding(.bottom, 12)
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("RESULT", displayMode: .inline)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
                }){
                    Image(systemName: "arrow.left")
                }
            .padding(12)
            .overlay(
                RoundedRectangle(cornerRadius: 144)
                    .stroke(Color.gray, lineWidth: 1)
                )
            )
            .background(Color("background"))
            .ignoresSafeArea()
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
