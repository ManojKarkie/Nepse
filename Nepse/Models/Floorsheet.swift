//
//  Floorsheet.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/26/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class FloorsheetList : Mappable{
    
    var header: [String]?
    var data: Floorsheet?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        header <- map["header"]
        data <- map["data"]
    }
    
}

class Floorsheet: Mappable {
    
    var from: String?
    var perPage: String?
    var to: String?
    var data: [FloorsheetData]?
    var total: String?
    var nextPageUrl: String?
    var currentPage: String?
    var lastPage: String?
    var path: String?
    var prevPage: String?
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        from <- map["from"]
        perPage <- map["per_page"]
        to <- map["to"]
        data <- map["data"]
        total <- map["total"]
        nextPageUrl <- map["next_page_url"]
        currentPage <- map["current_page"]
        lastPage <- map["last_page"]
        path <- map["path"]
        prevPage <- map["prev_page_url"]
    }
}

class FloorsheetData: Object, Mappable{
    
    @objc dynamic var seller: String = ""
    @objc dynamic var buyer: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var prflCode: String = ""
    @objc dynamic var rate : String = ""
    @objc dynamic var units: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        seller <- map["SELLER"]
        buyer <- map["BUYER"]
        date <- map["DATE"]
        prflCode <- map["PRFL_CODE"]
        rate <- map["RATE"]
        units <- map["UNITS"]
    }
}
