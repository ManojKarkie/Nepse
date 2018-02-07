//
//  WatchListData.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/7/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class WatchListData: Mappable {
    
    var data: [WatchList]?
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
    }
}

class WatchList : Mappable {
    
    var liveTrading: LiveTradingData?
    var prflCode: String?
    var effFrmDt: String?
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        liveTrading <- map["livetrading"]
        prflCode <- map["PRFL_CODE"]
        effFrmDt <- map["EFF_FRM_DT"]
    }
    
}
