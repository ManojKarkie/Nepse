//
//  CompanyDividend.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/31/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class CompanyDividendData: Mappable {
    
    var header: [String]?
    var data: [CompanyDividend]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        header <- map["header"]
        data <- map["data"]
    }
}

class CompanyDividend: Mappable{
    
    var bonusShare: String?
    var cashDividend: String?
    var fiscalYear: String?
    var totalDividend: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        bonusShare <- map["BONUS_SHARE"]
        cashDividend <- map["CASH_DIVIDEND"]
        fiscalYear <- map["FISCAL_YEAR"]
        totalDividend <- map["TOTAL_DIVIDEND"]
    }
}

