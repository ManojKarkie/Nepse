//
//  Dashboard.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/13/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class Dashboard: Mappable {
    
    var sym: String?
    var volume: String?
    var value: String?
    var cost: String?
    var profit: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        sym <- map["sym"]
        volume <- map["volume"]
        value <- map["value"]
        cost <- map["cost"]
        profit <- map["profit"]
    }
}

class Transactions: Mappable {
    
    var sym: String?
    var noOfTrans: String?
    var closingPrice: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        sym <- map["sym"]
        noOfTrans <- map["numberOfTransactions"]
        closingPrice <- map["closingPrice"]
    }
    
}
