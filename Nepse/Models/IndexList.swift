//
//  IndexList.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/26/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class IndexList: Mappable {
    
    var indices: [String]?
    var subIndices: [String]?
    var companies: [Company]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        indices <- map["indices"]
        subIndices <- map["sub-indices"]
        companies <- map ["company-list"]
    }
}

class Company: Mappable {
    
    var id: String?
    var symbol: String?
    var name: String?
    var permalinkOverride: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        symbol <- map["symbol"]
        permalinkOverride <- map["permalink_override"]
    }
}
