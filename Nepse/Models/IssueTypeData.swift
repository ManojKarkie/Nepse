//
//  IssueTypeData.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/6/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class IssueTypeData: Mappable {
    
    var data: [IssueType]?
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
    }
}

class  IssueType: Mappable {
    
    var issueTypeCode: String?
    var units: String?
    var value: String?
    
     init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        issueTypeCode <- map["ISSU_TYPE_CODE"]
        units <- map["units"]
        value <- map["value"]
    }
}
