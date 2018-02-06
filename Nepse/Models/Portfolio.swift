//
//  Portfolio.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/22/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm


class PortfolioArrayModel: Mappable {
    var data: [Portfolio]?
    var header: [String]?
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
        header <- map["header"]
    }
}

class Portfolio: Mappable {
    
    var prflCode: String?
    var units: String?
    var value: String?
    
    init() {}
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        prflCode <- map["prfl_code"]
        units <- map["units"]
        value <- map["value"]
    }
    }


