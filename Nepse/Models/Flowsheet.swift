//
//  Flowsheet.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/13/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class Flowsheet: Mappable {
    
    var sn: String?
    var contactNum: String?
    var sym: String?
    var buyer: String?
    var seller: String?
    var quantity: String?
    
    
    required init?(map: Map) {

    }
    
    func mapping(map: Map) {
        sn <- map["sn"]
        contactNum <- map["contact"]
        sym <- map["sym"]
        buyer <- map["buyer"]
        seller <- map["seller"]
        quantity <- map["qty"]
    }
}
