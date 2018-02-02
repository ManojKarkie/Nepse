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
    
    var floatedMarketCapital: String?
    var pointChange: String?
    var totalTransactions: String?
    var totalTradedShares: String?
    var totalScriptsTraded: String?
    var percentChange: String?
    var totalMarketCapital: String?
    var currentIndex: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
    
        floatedMarketCapital <- map["Floated Market Capitalization Rs."]
        pointChange <- map["Point Change"]
        totalTransactions <- map["Total Transactions"]
        totalTradedShares <- map["Total Traded Shares"]
        totalScriptsTraded <- map["Total Scrips Traded"]
        percentChange <- map["Percent Change"]
        totalMarketCapital <- map["Total Market Capitalization Rs."]
        currentIndex <- map["Current Index"]
    }
}
