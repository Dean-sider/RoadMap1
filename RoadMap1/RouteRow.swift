//
//  RouteRow.swift
//  RoadMap
//
//  Created by User19 on 2020/5/14.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct RouteRow: View {
    var route: Route
   @State private var ocean=["海線","山線"]
   
    let dateFormatter: DateFormatter =
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
       var body: some View {
           HStack {
            VStack{
               Text("路線:\(route.map)")
               Text("經過:\(route.landscape)")
            }
            Spacer()
            VStack{
               Text(ocean[route.Ocean])
               Text("路程大約 \(route.time) 小時")
            }
            Image(systemName: route.trueHeart ? "heart.fill" : "heart")
            
            /*Image("sunmax\(route.sunmax)")
               .resizable()
               .scaledToFill()
               .frame(width:30, height:30)*/
        }
       }
}

struct RouteRow_Previews: PreviewProvider {
    static var previews: some View {
        RouteRow(route: Route(map: "路線:", time: 0, trueHeart: true, sunmax: 5,Ocean:0,landscape:"沿途風景:"))
        .previewLayout(.sizeThatFits)
    }
}
