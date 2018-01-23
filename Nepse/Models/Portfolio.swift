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

//class PortfolioArray : Object, Mappable{
//    
//     dynamic var data: List<Portfolio>? = nil
//    
//    required convenience init?(map: Map) {
//        self.init()
//    }
//    
//    func mapping(map: Map) {
//        data <- map["data"]
//    }
//    
//    func normalModelArray() -> PortfolioArrayModel {
//        return PortfolioArrayModel(data: (self.data?.map{$0.normalMode()} ?? [PortfolioModel]()))
//    }
//    
//}

class PortfolioArrayModel {
    var data: [PortfolioModel]?
    
    init(data: [PortfolioModel]) {
        self.data = data
    }
}

class Portfolio: Object, Mappable {
    
    @objc dynamic var prflCode: String = ""
    @objc dynamic var units: Int = 0
    @objc dynamic var value: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "prflCode"
    }
    
    func mapping(map: Map) {
        prflCode <- map["prfl_code"]
        units <- map["units"]
        value <- map["value"]
    }
    
    func normalMode() -> PortfolioModel {
        return PortfolioModel(prflCode: self.prflCode, units: self.units, value: self.value)
    }
}

class PortfolioModel {
    
    var prflCode: String?
    var units: Int?
    var value: Int?
    
    init(prflCode: String, units: Int, value: Int) {
        self.prflCode = prflCode
        self.units = units
        self.value = value
    }
}
