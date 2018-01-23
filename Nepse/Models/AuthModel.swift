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
    
    func normalModel() -> AuthNormalModel {
        return AuthNormalModel(id: self.id, token: self.token)
    }
}

class AuthNormalModel {
    
    var id: String?
    var token: String?
    
    static var shared = AuthNormalModel()
    
    init() {}
    
    init(id: String, token: String) {
        self.id = id
        self.token = token
    }
}
