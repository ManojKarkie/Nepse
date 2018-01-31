//
//  CompanyProfile.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/29/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class CompanyProfile : Mappable {
    
    var mktCap: String?
    var pe: String?
    var tls: String?
    var opDt: String?
    var eps: String?
    var reserve: String?
    var photoUrl: String?
    var prflTypeCode: String?
    var bookValue: String?
    var fcVal: String?
    var email: String?
    var ltp: String?
    var lastYear: String?
    var code: String?
    var currFlg: String?
    var indexCode: String?
    var diff: String?
    var descr: String?
    var pdpVal: String?
    var url: String?
    var diffP: String?
    var addr: String?
    var lastQtr: String?
    var name: String?
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        mktCap <- map["MKT_CAP"]
        pe <- map["PE"]
        tls <- map["TLS"]
        opDt <- map["OP_DT"]
        eps <- map["EPS"]
        reserve <- map["RESERVE"]
        photoUrl <- map["PHOTO_URL"]
        prflTypeCode <- map["PRFL_TYP_CODE"]
        bookValue <- map["BOOK_VALUE"]
        fcVal <- map["FC_VAL"]
        email <- map["EMAIL"]
        ltp <- map["LTP"]
        lastYear <- map["LAST_YEAR"]
        code <- map["CODE"]
        currFlg <- map["CURR_FLG"]
        indexCode <- map["INDEX_CODE"]
        diff <- map["DIFF"]
        descr <- map["DESCR"]
        pdpVal <- map["PDP_VAL"]
        url <- map["URL"]
        diffP <- map["DIFFP"]
        addr <- map["ADDR"]
        lastQtr <- map["LAST_QTR"]
        name <- map["NAME"]
    }
    
}


