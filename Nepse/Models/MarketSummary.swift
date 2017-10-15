//
//  MarketSummary.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 10/14/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class MarketSummary: Mappable {
    
    var totalScripts: String?
    var currentIndex: String?
    var percentChange: String?
    var totalTransactions: String?
    var pointChange: String?
    var totalTraded: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
    
        totalScripts <- map["Total Scrips Traded"]
        currentIndex <- map["Current Index"]
        percentChange <- map["Percent Change"]
        totalTransactions <- map["Total Transactions"]
        pointChange <- map["Point Change"]
        totalTraded <- map["Total Traded Shares"]
    }
}
