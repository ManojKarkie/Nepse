//
//  BoughtSoldShares.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/6/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class BoughtSoldShares: Mappable {

    var boughtShares: [BoughtShares]?
    var soldShares: [SoldShares]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        boughtShares <- map["bought_share"]
        soldShares <- map["sold_share"]
    }
}

class BoughtShares : Mappable {
    
    var buyRate: String?
    var buyUnits:Int?
    var prflCode: String?
    var buyDt: String?
    var issueTypeCode: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        buyRate <- map["BUY_RATE"]
        buyUnits <- map["BUY_UNITS"]
        prflCode <- map["PRFL_CODE"]
        buyDt <- map["BUY_DT"]
        issueTypeCode <- map["ISSU_TYPE_CODE"]
    }
    
}

class SoldShares : Mappable{
    
    var sellDt: String?
    var prflCode: String?
    var sellUnits: Int?
    var sellRate: String?
    
    required init?(map: Map) {
        
    }
    
     func mapping(map: Map) {
        sellDt <- map["SELL_DT"]
        prflCode <- map["PRFL_CODE"]
        sellUnits <- map["SELL_UNITS"]
        sellRate <- map["SELL_RATE"]
    }
}
