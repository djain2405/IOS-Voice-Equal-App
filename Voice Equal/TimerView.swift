//
//  TimerView.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/15/21.
//

import SwiftUI

struct TimerView: View {
    
    @ObservedObject var userTime = SavedTime()

    @State var womenTimerIsPaused: Bool = true
    @State var menTimerIsPaused: Bool = true
    
    @State var womenTimer: Timer? = nil
    @State var menTimer: Timer? = nil


    var body: some View {
        VStack{
            HStack{
                Spacer()
                VStack{
                    Text("WOMEN")
                        .padding(.bottom, 8)
                    Text(String(format: "%02d", self.userTime.womenMins)+":"+String(format: "%02d", self.userTime.womenSecs))
                        .font(.title)
                    if womenTimerIsPaused {
                        Button(action:{
                            self.stopMenTimer()
                            self.startWomenTimer()
                        }, label: {
                            Image("womenplay")
                                .resizable()
                                .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                        .padding(8)
                    } else {
                        Button(action:{
                            self.stopWomenTimer()
                        }, label: {
                            Image("womenpause")
                                .resizable()
                                .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                        .padding(8)
                    }
                }
                .padding(24)
                .cornerRadius(100)
                .overlay(
                    Circle()
                        .strokeBorder(Color.gray,lineWidth: 1)
                        .frame(width: 280,height:160)
                )
                Spacer()
                VStack {
                    Text("MEN")
                        .padding(.bottom, 8)
                    Text(String(format: "%02d", self.userTime.menMins)+":"+String(format: "%02d", self.userTime.menSecs))
                        .font(.title)
                    if menTimerIsPaused {
                        Button(action:{
                            self.stopWomenTimer()
                            self.startMenTimer()
                        }, label: {
                            Image("menplay")
                                .resizable()
                                .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                        .padding(8)
                    } else {
                        Button(action:{
                            self.stopMenTimer()
                        }, label: {
                            Image("menpause")
                                .resizable()
                                .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                        .padding(8)
                    }
                }
                .padding(24)
                .cornerRadius(100)
                .overlay(
                    Circle()
                        .strokeBorder(Color.gray,lineWidth: 1)
                        .frame(width: 280,height:160)
                )
                Spacer()
            }
            Text("Reset")
            Button(action: {
                print("clicked the reset button")
            }) {
                Image(systemName: "arrow.clockwise.circle")
                    .resizable()
                    .foregroundColor(Color.gray)
                    .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            Text("Total Duration")
                .font(.caption)
            Text("00:00")
                .font(.headline)
        }
    }
    
    func startWomenTimer(){
      womenTimerIsPaused = false
      womenTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
        if self.userTime.womenSecs ==  59 {
          self.userTime.womenSecs = 0
          self.userTime.womenMins = self.userTime.womenMins + 1
        } else {
          self.userTime.womenSecs = self.userTime.womenSecs + 1
        }
      }
    }
    
    func startMenTimer(){
      menTimerIsPaused = false
      menTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
        if self.userTime.menSecs ==  59 {
          self.userTime.menSecs = 0
          self.userTime.menMins = self.userTime.menMins + 1
        } else {
          self.userTime.menSecs = self.userTime.menSecs + 1
        }
      }
    }
    
    func stopWomenTimer(){
      womenTimerIsPaused = true
      womenTimer?.invalidate()
        womenTimer = nil
    }
    
    func stopMenTimer(){
      menTimerIsPaused = true
      menTimer?.invalidate()
        menTimer = nil
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
