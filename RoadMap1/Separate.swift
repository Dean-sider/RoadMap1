//
//  Separate.swift
//  RoadMap1
//
//  Created by User15 on 2020/5/18.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct Separate: View {
    @ObservedObject var routesData = RouteData()
    var body: some View {
       TabView {
            RouteList()
            .tabItem {
                Image(systemName:"list.dash")
                Text("Route table")
            }
        PieChartView(routesData: self.routesData)
            .tabItem {
                Image(systemName: "map")
                Text("Analysis")
                
            }
        }
        .accentColor(.orange)
    }
}

struct Separate_Previews: PreviewProvider {
    static var previews: some View {
        Separate()
    }
}
