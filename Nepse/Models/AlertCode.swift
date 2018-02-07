//
//  AlertCode.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/7/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class AlertCodeList: Mappable {
    
    var data: [AlertCode]?
    
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
    }
}

class AlertCode: Mappable{
    
    var descr: String?
    var category: String?
    var code: Int?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        descr <- map["DESCR"]
        category <- map["CATEGORY"]
        code <- map["CODE"]
    }
}
