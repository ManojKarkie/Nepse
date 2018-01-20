//
//  User.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/19/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper
import ObjectMapper_Realm
import RealmSwift

class User: Object, Mappable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var mrchCode: String?
    @objc dynamic var brokerCode: String?
    @objc dynamic var name: String = ""
    @objc dynamic var code: String = ""
    @objc dynamic var descr: String?
    @objc dynamic var addr: String?
    @objc dynamic var email: String = ""
    @objc dynamic var cellularVND: String?
    @objc dynamic var regDT: String?
    @objc dynamic var dmatNO: String?
    @objc dynamic var cellphone: String?
    @objc dynamic var dob: String?
    @objc dynamic var pin: String?
    @objc dynamic var mac1: String?
    @objc dynamic var mac2: String?
    @objc dynamic var mac3: String?
    @objc dynamic var sq1: String?
    @objc dynamic var sq2: String?
    @objc dynamic var sq1Ans: String?
    @objc dynamic var sq2Ans: String?
    @objc dynamic var created: String = ""
    @objc dynamic var updated: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        mrchCode <- map["MRCH_CODE"]
        brokerCode <- map["BROKER_CODE"]
        name <- map["NAME"]
        code <- map["CODE"]
        descr <- map["DESCR"]
        addr <- map["ADDR"]
        email <- map["EMAIL"]
        cellularVND <- map["CELLULAR_VND"]
        regDT <- map["REG_DT"]
        dmatNO <- map["DMAT_NO"]
        cellphone <- map["CELLPHONE"]
        dob <- map["DOB"]
        pin <- map["PIN"]
        mac1 <- map["MAC_1"]
        mac2 <- map["MAC_2"]
        mac3 <- map["MAC_3"]
        sq1 <- map["SQ_1"]
        sq2 <- map["SQ_2"]
        sq1Ans <- map["SQ_1_ANS"]
        sq2Ans <- map["SQ_2_ANS"]
        created <- map["CRTE_DT"]
        updated <- map["UPD_DT"]
    }
    
    func normalModel() -> UserModel {
        return UserModel(id: self.id, mrchCode: self.mrchCode ?? "", brokerCode: self.brokerCode ?? "", name: self.name, code: self.code, descr: self.descr ?? "", addr: self.addr ?? "", email: self.email, cellularVND: self.cellularVND ?? "", regDT: self.regDT ?? "", dmatNO: self.dmatNO ?? "", cellphone: self.cellphone ?? "", dob: self.dob ?? "", pin: self.pin ?? "", mac1: self.mac1 ?? "", mac2: self.mac2 ?? "", mac3: self.mac3 ?? "", sq1: self.sq1 ?? "", sq2: self.sq2 ?? "", sq1Ans: self.sq1Ans ?? "", sq2Ans: self.sq2Ans ?? "", created: self.created, updated: self.updated)
    }
}

class UserModel {
    
    var id: Int?
    var mrchCode: String?
    var brokerCode: String?
    var name: String?
    var code: String?
    var descr: String?
    var addr: String?
    var email: String?
    var cellularVND: String?
    var regDT: String?
    var dmatNO: String?
    var cellphone: String?
    var dob: String?
    var pin: String?
    var mac1: String?
    var mac2: String?
    var mac3: String?
    var sq1: String?
    var sq2: String?
    var sq1Ans: String?
    var sq2Ans: String?
    var created: String?
    var updated: String?
    
    static var shared = UserModel()
    
    init() {}
    
    init(id: Int,
         mrchCode: String,
         brokerCode: String,
         name: String,
         code: String,
         descr: String,
         addr: String,
         email: String,
         cellularVND: String,
         regDT: String,
         dmatNO: String,
         cellphone: String,
         dob: String,
         pin: String,
         mac1: String,
         mac2: String,
         mac3: String,
         sq1: String,
         sq2: String,
         sq1Ans: String,
         sq2Ans: String,
         created: String,
         updated: String) {
        self.id = id
        self.mrchCode = mrchCode
        self.brokerCode = brokerCode
        self.name = name
        self.code = code
        self.descr = descr
        self.addr = addr
        self.email = email
        self.cellularVND = cellularVND
        self.regDT = regDT
        self.dmatNO = dmatNO
        self.cellphone = cellphone
        self.dob = dob
        self.pin = pin
        self.mac1 = mac1
        self.mac2 = mac2
        self.mac3 = mac3
        self.sq1 = sq1
        self.sq2 = sq2
        self.sq1Ans = sq1Ans
        self.sq2Ans = sq2Ans
        self.created = created
        self.updated = updated
    }
    
    
}
