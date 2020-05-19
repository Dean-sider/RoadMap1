//
//  RouteEditor.swift
//  RoadMap
//
//  Created by User19 on 2020/5/14.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct RouteEditor: View {
       @Environment(\.presentationMode) var presentationMode//按下save返回介面
       var routesData: RouteData//按save新增資料
       @State private var map = ""
       @State private var time = 0
       @State private var trueHeart = true
       @State private var sunmax: CGFloat = 0
       @State private var showmapAlert = false
       @State private var Ocean = 0
       @State private var landscape = ""
       var ocean=["海線","山線"]
       var editroute: Route?//修改資料時先顯示原先資料
       var body: some View {
               Form{
                TextField("輸入路線", text: $map)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.yellow, lineWidth: 3))
                Picker("選擇海／山線", selection: $Ocean) {
                    ForEach(0..<self.ocean.count){ (index) in
                                   Text(self.ocean[index])
                               }
                           }.pickerStyle(SegmentedPickerStyle())
                
                   Stepper("路程大約 \(time) 小時", value: $time, in: 0...50)
                   Toggle("加入我的最愛", isOn: $trueHeart)
                   HStack
                   {
                       Text("陽光強度: \(Int(sunmax)) ")
                       Slider(value:$sunmax, in: 0...5, step: 1, minimumValueLabel: Image(systemName: "sun.max"), maximumValueLabel: Image(systemName: "sun.max.fill")){Text("")}.accentColor(.orange)//設定slider的顏色
                   }
                    TextField("沿途風景", text: $landscape)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.purple, lineWidth: 3))
                }
               .navigationBarTitle(editroute == nil ?"新增路線":"編輯路線")
               .navigationBarItems(
                trailing: Button("儲存") {
                if self.map == ""
                {
                    self.showmapAlert=true
                }
                else{
                    let route = Route(map: self.map, time: self.time, trueHeart: self.trueHeart ,sunmax:Int(self.sunmax),Ocean: self.Ocean, landscape:   self.landscape)//按save新增資料
                   
                //判斷新增還是修改資料
                   if let editLover = self.editroute {
                       let index = self.routesData.routes.firstIndex {
                          $0.id == editLover.id//function firstIndex:找出路線在array裡的位置
                       }!
                       self.routesData.routes[index] = route
                   } else {
                       self.routesData.routes.insert(route, at: 0)//按save新增資料
                   }
                   self.presentationMode.wrappedValue.dismiss()//搭配Environment
               }
               }
                .alert(isPresented: $showmapAlert)
                {
                    () -> Alert in
                    return Alert(title: Text("錯誤!!"), message: Text("路線不能為空白"))
                }
               )
                   .onAppear {//修改資料時將資料存入map,time,trueHeart,sunmax,Ocean,landscape,觸發畫面更新,讓畫面顯示資料
                       if let editroute = self.editroute {
                           self.map = editroute.map
                           self.time = editroute.time
                           self.trueHeart = editroute.trueHeart
                           self.sunmax = CGFloat(editroute.sunmax)
                           self.Ocean = editroute.Ocean
                           self.landscape = editroute.landscape
                       }
           }
           
       }
}

struct RouteEditor_Previews: PreviewProvider {
    static var previews: some View {
        RouteEditor(routesData: RouteData())
    }
}
