//
//  GlobalConstant.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/18/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation

class GlobalConstant {
    
    static var shared = GlobalConstant()
    
    
    enum Status {
        case loggedIn
        case notLogged
    }
    
    var status: Status = .notLogged
}
