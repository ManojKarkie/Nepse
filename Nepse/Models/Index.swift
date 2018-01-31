//
//  File.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/25/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class IndexArray: Mappable {
    
    var data: [Index]?
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
    }
}

class Index : Mappable{
    
    var turnover: String?
    var pctChange: String?
    var date: String?
    var indexCode: String?
    var value: String?
    var absChange: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        turnover <- map["TURNOVER"]
        pctChange <- map["PCT_CHANGE"]
        date <- map["DATE"]
        indexCode <- map["INDEX_CODE"]
        value <- map["VALUE"]
        absChange <- map["ABS_CHANGE"]
        
    }
}
