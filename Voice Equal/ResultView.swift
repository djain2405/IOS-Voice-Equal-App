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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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

        
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
