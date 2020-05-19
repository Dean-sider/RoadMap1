//
//  ContentView.swift
//  RoadMap
//
//  Created by User19 on 2020/5/14.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       NavigationView {
           ZStack{
           NavigationLink(destination: Separate()){
           Image("恆春")
        .renderingMode(.original)//當按鈕時會變單一藍色,為了返回原圖片
                .resizable()
                .scaledToFit()
                .offset(y: 50)//照片位置
                .frame(width:350,height:900)//圓大小
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                .shadow(radius: 80)//陰影
                .offset(y: -80)//圓位置
                .frame(width:400,height:1000)
                .padding()
                }
          .background(LinearGradient(gradient: Gradient(colors:[Color(red:171/255,green:236/255,blue:214/255),Color(red:251/255,green:237/255,blue:150/255)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x:1,y:0)))
               Text("Route ")
                   .offset(y: 140)
                   .font(.custom("Snell Roundhand",size:60))
           }
             .navigationBarTitle("Route Map", displayMode: .inline)
               }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
