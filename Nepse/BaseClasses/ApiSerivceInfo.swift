//
//  ApiSerivceInfo.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/1/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation

protocol ApiServiceType {
    var apiManager: Auth {get}
    var baseUrl: String {get}
}

extension ApiServiceType {
    var apiManager: Auth {return Auth.shared}
    var baseUrl: String {return apiManager.baseUrl()}
}
