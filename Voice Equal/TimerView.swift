//
//  TimerView.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/15/21.
//

import SwiftUI

struct TimerView: View {
    @State var womenMins:Int = 0
    @State var womenSecs:Int = 0
    @State var womenTimerIsPaused: Bool = true
    
    @State var menMins:Int = 0
    @State var menSecs:Int = 0
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
                    Text(String(format: "%02d", womenMins)+":"+String(format: "%02d", womenSecs))
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Button(action: {
                        self.startWomenTimer()
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
                        self.stopWomenTimer()
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
        if self.womenSecs == 59 {
          self.womenSecs = 0
          self.womenMins = self.womenMins + 1
        } else {
          self.womenSecs = self.womenSecs + 1
        }
      }
    }
    
    func stopWomenTimer(){
      womenTimerIsPaused = true
      womenTimer?.invalidate()
        womenTimer = nil
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
