//
//  LiveTrading.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/13/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

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

class LiveTradingData: Object, Mappable {
    
    @objc dynamic var volume: Int = 0
    @objc dynamic var turnover: String = ""
    @objc dynamic var open: String = ""
    @objc dynamic var high: String = ""
    @objc dynamic var diffP: String = ""
    @objc dynamic var low: String = ""
    @objc dynamic var close: String = ""
    @objc dynamic var diffVal: String = ""
    @objc dynamic var prflCode: String = ""
    
    required convenience init?(map: Map) {
        self.init()
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
