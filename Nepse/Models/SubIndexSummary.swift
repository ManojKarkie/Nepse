//
//  SubIndexSummary.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 10/16/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class SubIndexSummary: Mappable {
    
    var subIndices: String?
    var turnover: String?
    var current: String?
    var pointChange: String?
    var percent: String?
    var trend: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        subIndices <- map["index"]
        turnover <- map["turnover"]
        current <- map["current"]
        pointChange <- map["pointChange"]
        percent <- map["percent"]
        trend <- map["trend"]
    }
}

