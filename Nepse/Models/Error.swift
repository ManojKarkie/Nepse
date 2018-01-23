//
//  Error.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/20/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class ResponseError : Mappable{
    
    var code: [String]?
    var email: [String]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        email <- map["email"]
    }
}
