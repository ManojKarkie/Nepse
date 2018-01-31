//
//  LiveTrading.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/13/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class LiveTrading: Mappable {
    
    var header: [String]?
    var data: [LiveTradingData]?
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        header <- map["header"]
        data <- map["data"]
    }
    
}

class LiveTradingData: Mappable {
    
    var volume: Int?
    var turnover: String?
    var open: String?
    var high: String?
    var diffP: String?
    var low: String?
    var close: String?
    var diffVal: String?
    var prflCode: String?
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        volume <- map["VOLUME"]
        turnover <- map["TURNOVER"]
        open <- map["OPEN"]
        high <- map["HIGH"]
        diffP <- map["DIFFP"]
        low <- map["LOW"]
        close <- map["CLOSE"]
        diffVal <- map["DIFF"]
        prflCode <- map["PRFL_CODE"]
    }
}
