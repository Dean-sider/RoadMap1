//
//  PieChartView.swift
//  RoadMap1
//
//  Created by User15 on 2020/5/19.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct PieChartView: View {
            @ObservedObject var routesData = RouteData()
            var percentages: [Double] = [0,0]
            var count:[Double] = [0,0]
            var totalcount:Int = 0
            var angles:[Angle]
           init(routesData : RouteData){
               self.routesData = routesData
               for data in routesData.routes{
                    totalcount += 1
                if data.Ocean == 0{
                     count[0] += 1
                }
                else if data.Ocean == 1{
                    count[1] += 1
                   }
                }
                percentages[0] = count[0]/Double(totalcount)
                percentages[1] = count[1]/Double(totalcount)
                angles = [Angle]()
                var degree : Double = 0
            for percentage in percentages{
                angles.append(.degrees(degree))
                degree += 360 * percentage
            }
    }
    var body: some View {
        VStack{
        if self.routesData.routes.count != 0{
            Text("路線分析")
                .font(.system(size:40))
            ZStack{
                PieChart( startAngle:self.angles[0] , endAngle:self.angles[1])
                    .fill(Color.purple)
                PieChart( startAngle:self.angles[1] , endAngle:self.angles[0])
                    .fill(Color.blue)
            }
            .frame(width:300,height:350)
            .padding()
            HStack{
                Image(systemName:"square.fill")
                    .foregroundColor(.purple)
                Text("海線\(percentages[0])")
                    .font(.system(size : 20))
            }
            HStack{
                Image(systemName:"square.fill")
                .foregroundColor(.blue)
                Text("山線\(percentages[1])")
                .font(.system(size : 20))
            }
            }
        else{
            Text("未輸入資料...")
                .font(.system(size:23))
                .fontWeight(.bold)
                .foregroundColor(Color.gray)
            }
        }
    }
}


struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(routesData: RouteData())
    }
}
