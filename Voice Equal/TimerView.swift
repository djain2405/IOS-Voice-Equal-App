//
//  TimerView.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/15/21.
//

import SwiftUI
import Combine

struct TimerView: View {
    
    @ObservedObject var userTime = SavedTime()
    @ObservedObject var themeColor: ThemeColor = .shared

    @State var womenTimerIsPaused: Bool = true
    @State var menTimerIsPaused: Bool = true
    
    @State var womenStartTimer: Bool = true
    @State var menStartTimer: Bool = true
    
    @State var womenTimer: Timer? = nil
    @State var menTimer: Timer? = nil


    private func startWomenTimerOnPlay() {
        self.themeColor.backgroundColor = Color("women")
        self.themeColor.textColor = Color(.white)
        self.themeColor.resultButton = Color(.darkGray)
        self.themeColor.womenCounterTextColor = Color(.white)
        self.themeColor.menCounterTextColor = Color(.white)
        self.themeColor.buttonTint = Color(.white)
        self.stopMenTimer()
        self.startWomenTimer()
    }
    
    private func startMenTimerOnPlay() {
        self.themeColor.backgroundColor = Color("men")
        self.themeColor.textColor = Color(.white)
        self.themeColor.resultButton = Color(.darkGray)
        self.themeColor.womenCounterTextColor = Color(.white)
        self.themeColor.menCounterTextColor = Color(.white)
        self.themeColor.buttonTint = Color(.white)
        self.stopWomenTimer()
        self.startMenTimer()
    }
    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text("WOMEN")
                        .foregroundColor(self.themeColor.textColor)
                        .padding(.bottom, 8)
                    Text(String(format: "%02d", self.userTime.womenMins)+":"+String(format: "%02d", self.userTime.womenSecs))
                        .foregroundColor(self.themeColor.textColor)
                        .font(.title)
                    if womenTimerIsPaused {
                        if(womenStartTimer) {
                            Button(action:{
                                womenStartTimer = false
                                startWomenTimerOnPlay()
                            }, label: {
                                Text("Start Timer")
                                    .foregroundColor(.white)
                            })
                            .padding(8)
                            .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(Color("women"))
                            )
                        } else {
                            Button(action:{
                                startWomenTimerOnPlay()
                            }, label: {
                                Image("womenplay")
                                    .resizable()
                                    .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            })
                            .padding(8)
                        }
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
                .background(
                    ZStack {
                        Circle()
                            .shadow(color: .white, radius: 10, x: -10, y: -10)
                            .shadow(color: .black, radius: 10, x: 10, y: 10)
                            .blendMode(.overlay)
                            .frame(width: 280,height:160)
                        Circle()
                            .fill(self.themeColor.backgroundColor)
                            .frame(width: 280,height:160)
                    }
                )
                Spacer()
                VStack {
                    Text("MEN")
                        .foregroundColor(self.themeColor.textColor)
                        .padding(.bottom, 8)
                    Text(String(format: "%02d", self.userTime.menMins)+":"+String(format: "%02d", self.userTime.menSecs))
                        .foregroundColor(self.themeColor.textColor)
                        .font(.title)
                    if menTimerIsPaused {
                        if(menStartTimer) {
                            Button(action:{
                                menStartTimer = false
                                startMenTimerOnPlay()
                            }, label: {
                                Text("Start Timer")
                                    .foregroundColor(.white)
                            })
                            .padding(8)
                            .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(Color("men"))
                            )
                        } else {
                            Button(action:{
                                startMenTimerOnPlay()
                            }, label: {
                                Image("menplay")
                                    .resizable()
                                    .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            })
                            .padding(8)
                        }
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
                .background(
                    ZStack {
                        Circle()
                            .shadow(color: .white, radius: 10, x: -5, y: -5)
                            .shadow(color: .black, radius: 10, x: 5, y: 5)
                            .blendMode(.overlay)
                            .frame(width: 280,height:160)
                        Circle()
                            .fill(self.themeColor.backgroundColor)
                            .frame(width: 280,height:160)
                    }
                )
            }
            .padding()
            Text("Reset")
                .foregroundColor(self.themeColor.textColor)
            Button(action: {
                print("clicked the reset button")
                UserDefaults.resetDefaults()
                self.themeColor.backgroundColor = Color("background")
                self.themeColor.textColor = Color(.black)
                self.themeColor.resultButton = Color("background")
            }) {
                Image(systemName: "arrow.clockwise.circle")
                    .resizable()
                    .foregroundColor(self.themeColor.buttonTint)
                    .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            Text("Total Duration")
                .foregroundColor(self.themeColor.textColor)
                .font(.caption)
                .padding(.top, 24)
            Text(String(format: "%02d", self.userTime.totalMins)+":"+String(format: "%02d", self.userTime.totalSecs))
                .foregroundColor(self.themeColor.textColor)
                .font(.headline)
        }
    }
    
    func startWomenTimer(){
      womenTimerIsPaused = false
      womenTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
        self.themeColor.backgroundColor = Color("women")
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
        self.themeColor.backgroundColor = Color("men")
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
      calculateTotal()
      womenTimer?.invalidate()
      womenTimer = nil
    }
    
    func stopMenTimer(){
      menTimerIsPaused = true
      calculateTotal()
      menTimer?.invalidate()
        menTimer = nil
    }
    
    func calculateTotal(){
      self.userTime.totalMins = self.userTime.menMins + self.userTime.womenMins
      self.userTime.totalSecs = self.userTime.menSecs + self.userTime.womenSecs
      
      if(self.userTime.totalSecs > 59) {
        self.userTime.totalSecs -= 59
        self.userTime.totalMins += 1
      }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
