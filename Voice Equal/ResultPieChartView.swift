//
//  ResultPieChartView.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/17/21.
//

import SwiftUI

struct ResultPieChartView: View {
    
    @ObservedObject var userTime = SavedTime()
    @ObservedObject var userCount = SavedCount()
    
    var count: Bool
    @State var dataModel: [ChartCellModel] = []
    
    var body: some View {
        DonutChart(dataModel: ChartDataModel.init(dataModel: dataModel))
        .frame(width: 120, height: 120, alignment: .center)
        .padding()
            .onAppear{
                self.calculateData(count: count)
            }
    }
    
    func calculateData(count:Bool) {
        var womenCount = 0
        var menCount = 0
        var womenTime = 0
        var menTime = 0
        
        if(count) {
            womenCount = Int(self.userCount.womenCount) ?? 0
            menCount = Int(self.userCount.menCount) ?? 0

        } else {
            womenTime = self.userTime.womenMins*60 + self.userTime.womenSecs
            menTime = self.userTime.menMins*60 + self.userTime.menSecs
        }

        dataModel = [ ChartCellModel(color: Color("men"), value: count ? CGFloat(menCount) : CGFloat(menTime), name: "Men"),
                      ChartCellModel(color: Color("women"), value: count ? CGFloat(womenCount): CGFloat(womenTime), name: "Women")
            ]
    }
    
}

struct ResultPieChartView_Previews: PreviewProvider {
    static var previews: some View {
        ResultPieChartView(count:false)
    }
}

struct PieChartCell: Shape {
    let startAngle: Angle
    let endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint.init(x: (rect.origin.x + rect.width)/2, y: (rect.origin.y + rect.height)/2)
    let radii = min(center.x, center.y)
        let path = Path { p in
            p.addArc(center: center,
                     radius: radii,
                     startAngle: startAngle,
                     endAngle: endAngle,
                     clockwise: true)
            p.addLine(to: center)
        }
        return path
   }
}

struct InnerCircle: Shape {
    let ratio: CGFloat
    func path(in rect: CGRect) -> Path {
         let center = CGPoint.init(x: (rect.origin.x + rect.width)/2, y: (rect.origin.y + rect.height)/2)
        let radii = min(center.x, center.y) * ratio
         let path = Path { p in
             p.addArc(center: center,
                      radius: radii,
                      startAngle: Angle(degrees: 0),
                      endAngle: Angle(degrees: 360),
                      clockwise: true)
             p.addLine(to: center)
         }
         return path
    }
}

struct DonutChart: View {
    
    let dataModel: ChartDataModel
    var body: some View {
            ZStack {
                PieChart(dataModel: dataModel)
                InnerCircle(ratio: 0.4).foregroundColor(.white)
            }
    }
}

struct PieChart: View {
    
    let dataModel: ChartDataModel
    var body: some View {
            ZStack {
                ForEach(dataModel.chartCellModel) { dataSet in
                    PieChartCell(startAngle: self.dataModel.angle(for: dataSet.value), endAngle: self.dataModel.startingAngle)
                        .foregroundColor(dataSet.color)
//                        .overlay(
//                            Text(dataSet.value.description)
//                                .font(.system(.callout, design: .rounded))
//                                .bold()
//                                .foregroundColor(.white)
//                                .offset(x: -20, y: 0)
//                        )
                }
            }
    }
}

struct ChartCellModel: Identifiable {
    let id = UUID()
    let color: Color
    let value: CGFloat
    let name: String
}

final class ChartDataModel: ObservableObject {
    var chartCellModel: [ChartCellModel]
    var startingAngle = Angle(degrees:90)
    private var lastBarEndAngle = Angle(degrees: 90)
    
        
    init(dataModel: [ChartCellModel]) {
        chartCellModel = dataModel
    }
    
    var totalValue: CGFloat {
        chartCellModel.reduce(CGFloat(0)) { (result, data) -> CGFloat in
            result + data.value
        }
    }
    
    func angle(for value: CGFloat) -> Angle {
        if startingAngle != lastBarEndAngle {
            startingAngle = lastBarEndAngle
        }
        lastBarEndAngle += Angle(degrees: Double(value / totalValue) * 360 )
        print(lastBarEndAngle.degrees)
        return lastBarEndAngle
    }
}
