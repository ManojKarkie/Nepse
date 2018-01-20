//
//  AuthModel.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/19/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class AuthModel: Object, Mappable {
    
    @objc dynamic var id: String = "0"
    @objc dynamic var user: User?
    @objc dynamic var token: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    static let shared = AuthModel()
    
    func mapping(map: Map) {
        user <- map["user"]
        token <- map["token"]
    }
}
