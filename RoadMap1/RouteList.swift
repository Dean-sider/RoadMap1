//
//  RouteList.swift
//  RoadMap
//
//  Created by User19 on 2020/5/14.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct RouteList: View {
    @ObservedObject var routesData = RouteData()
    @State private var showEditroute = false
    var body: some View {
        NavigationView {
            List {
                ForEach(routesData.routes) { (route) in
                    NavigationLink(destination: RouteEditor(routesData: self.routesData, editroute: route)) {
                        RouteRow(route: route)
                    }
                }
        .onDelete { (indexSet) in
            self.routesData.routes.remove(atOffsets: indexSet)//routesData的routes改變,觸發RouteList畫面更新
                }
                
            }
            .navigationBarTitle("恆春至台東路線表",displayMode: .inline)
            .navigationBarItems(leading: EditButton() , trailing: Button(action: {
                self.showEditroute = true
            }) {
                Image(systemName: "plus.circle.fill")
            })
                .sheet(isPresented: $showEditroute) {
                    NavigationView {
                        RouteEditor(routesData: self.routesData)//點選add顯示RouteEditor時傳入routesData
                    }
                }
        }
    }
}
struct RouteList_Previews: PreviewProvider {
    static var previews: some View {
        RouteList()
    }
}
