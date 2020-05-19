//
//  RouteData.swift
//  RoadMap
//
//  Created by User19 on 2020/5/14.
//  Copyright © 2020 ntou. All rights reserved.
//

import Foundation

class RouteData: ObservableObject {
    @Published var routes  = [Route](){
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(routes) {
                UserDefaults.standard.set(data, forKey: "routes")
            }
        }
    }
    init() {
           if let data = UserDefaults.standard.data(forKey: "routes") {
               let decoder = JSONDecoder()
               if let decodedData = try? decoder.decode([Route].self, from: data) {
                   routes = decodedData
               }
           }
       }
}
