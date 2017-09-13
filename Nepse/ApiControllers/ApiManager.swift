//
//  ApiManager.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/13/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import Alamofire

class ApiManager {
    
    static let shared = ApiManager()
    
    func fetchData(url: URL, completion: @escaping ([String:Any]) -> ()) {
       let request = Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
        let data = response.result.value as? [String:Any]
        completion(data ?? [String:Any]())
        }
    }
    
}
