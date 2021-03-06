//
//  CounterView.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/14/21.
//

import SwiftUI

struct CounterView: View {
    
    @ObservedObject var userCount = SavedCount()
    @ObservedObject var themeColor: ThemeColor = .shared
    @State var editMode = false

    var body: some View {
        VStack {
            Text("NUMBER OF PEOPLE")
                .foregroundColor(self.themeColor.textColor)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .padding(.bottom, 16)
            HStack{
                HStack{
                    Text("WOMEN:")
                        .foregroundColor(self.themeColor.textColor)
                        .padding(8.0)
                    TextField("", text: $userCount.womenCount)
                        .disabled(self.editMode)
                        .foregroundColor(
                            !self.editMode ? Color.black : Color("women"))
                        .keyboardType(.decimalPad)
                        .frame(width: 32)
                        .font(.title2)
                }
                Spacer()
                HStack{
                    Text("MEN:")
                        .foregroundColor(self.themeColor.textColor)
                        .padding(8.0)
                    TextField("", text:$userCount.menCount )
                        .disabled(self.editMode)
                        .foregroundColor(
                            !self.editMode ? Color.black : Color("men"))
                        .keyboardType(.decimalPad)
                        .frame(width: 32)
                        .font(.title2)
                }
            }
            
            if !editMode {
                    Button(action: {
                    // Dismiss keyboard on Save
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                        self.editMode.toggle()
                    print("Saved!")
                }, label: {
                    Text("SAVE")
                        .foregroundColor(Color.white)
                })
                .padding(10)
                .background(Color("savebutton"))
            }
            
            if editMode {
                Button(action: {
                    self.editMode.toggle()
                    print("clicked the button")
                }) {
                    Image(systemName: "pencil.circle")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
        }
        .padding()
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .shadow(color: .white, radius: 10, x: -5, y: -5)
                    .shadow(color: .black, radius: 10, x: 5, y: 5)
                    .blendMode(.overlay)
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(self.themeColor.backgroundColor)
            }
        )
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
