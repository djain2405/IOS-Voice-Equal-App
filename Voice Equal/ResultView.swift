//
//  ResultView.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/15/21.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var userTime = SavedTime()
    @ObservedObject var userCount = SavedCount()
    @State var womenCountPercent: Int = 0
    @State var menCountPercent: Int = 0
    @State var womenTimePercent: Int = 0
    @State var menTimePercent: Int = 0

    var body: some View {
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("HEADCOUNT")
                        ResultPieChartView(count: true)
                    }
                    Spacer()
                    VStack{
                        Text("TIME")
                        ResultPieChartView(count: false)
                    }
                    Spacer()
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("WOMEN")
                        .bold()
                        .foregroundColor(Color("women"))
                        .padding(.bottom, 8)
                    Group{
                        Text("\(self.womenCountPercent)%")
                            .bold().foregroundColor(Color("women")) + Text(" of speakers were women and they spoke ") + Text("\(self.womenTimePercent)%").bold().foregroundColor(Color("women")) + Text(" of the time")
                    }
                    .padding(.bottom, 12)
                    Text("MEN")
                            .bold()
                            .foregroundColor(Color("men"))
                            .padding(.bottom, 8)
                    Group{
                        Text("\(self.menCountPercent)%")
                            .bold().foregroundColor(Color("men")) + Text(" of speakers were women and they spoke ") + Text("\(self.menTimePercent)%").bold().foregroundColor(Color("men")) + Text(" of the time")
                    }
                    .padding(.bottom, 12)
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                )
                Spacer()
            }
            .onAppear(){
                let totalCount = (Int(self.userCount.menCount) ?? 0) + (Int(self.userCount.womenCount) ?? 0)
                if(totalCount > 0) {
                    self.menCountPercent = ((Int(self.userCount.menCount) ?? 0) * 100)/totalCount
                    self.womenCountPercent = ((Int(self.userCount.womenCount) ?? 0) * 100)/totalCount
                }
                let totalTime = self.userTime.menMins * 60 + self.userTime.menSecs + self.userTime.womenMins * 60 + self.userTime.womenSecs
                if(totalTime > 0) {
                    self.menTimePercent = ((self.userTime.menMins * 60 + self.userTime.menSecs) * 100)/totalTime
                    self.womenTimePercent = ((self.userTime.womenMins * 60 + self.userTime.womenSecs) * 100)/totalTime
                }
               
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
