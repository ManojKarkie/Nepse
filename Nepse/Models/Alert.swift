//
//  Alert.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/7/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class AlertList: Mappable {
    
    var data: [Alert]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
    }
}

class Alert: Mappable {
    
    var prflCode: String?
    var alrtCode: String?
    var cstmCode: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        prflCode <- map["PRFL_CODE"]
        alrtCode <- map["ALRT_CODE"]
        cstmCode <- map["CSTM_CODE"]
    }
}
