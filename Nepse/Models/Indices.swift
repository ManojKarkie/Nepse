//
//  Indices.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/25/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class IndicesArray: Mappable {
    
    var data: [SubIndices]?
    var header: [String]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
        header <- map["header"]
    }
}

class Indices: Mappable {
    
    var turnover: String?
    var ptsChange: String?
    var code: String?
    var currentPts: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        turnover <- map["TURNOVER"]
        ptsChange <- map["PTS_CHNG"]
        code <- map["CODE"]
        currentPts <- map["CURR_PTS"]
    }
}

