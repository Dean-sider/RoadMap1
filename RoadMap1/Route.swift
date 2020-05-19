//
//  Route.swift
//  RoadMap
//
//  Created by User19 on 2020/5/14.
//  Copyright © 2020 ntou. All rights reserved.
//

import Foundation

struct Route: Identifiable, Codable{//typealias Codable =Decodable & Encodable
    let id = UUID()
    var map: String
    var time: Int
    var trueHeart: Bool
    var sunmax: Int
    var Ocean: Int
    var landscape: String
    
}

