//
//  DashboardService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/13/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON
import Alamofire
class DashboardService : ApiServiceType{
    
    
    func fetchDashboard(completion: @escaping (Dashboard) -> ()) {
        let url = self.baseUrl + "api/v1/dashboard"
        self.apiManager.request(url: url, parameters: nil, headers: nil, method: .get, encoding: JSONEncoding.default) { (data) in
            if let model = Mapper<Dashboard>().map(JSON: data) {
                completion(model)
            }
        }
    }
    
    func fetchIndexGraph(date: String, code: String,completion: @escaping (IndexArray) -> () ) {
        let url = self.baseUrl + "api/v1/d-index"
        let parameters = ["MONTH" : date , "INDEX_CODE": code] as [String: Any]
        self.apiManager.requestArray(url: url, parameters: parameters, headers: nil, method: .get, encoding: URLEncoding.default) { (data) in
            let data = ["data": data]
            if let array = Mapper<IndexArray>().map(JSON: data) {
                completion(array)
            }
        }
    }
    
    func fetchIndexList(completion: @escaping (IndexList) -> ()) {
        let url = self.baseUrl + "api/v1/list-index"
        self.apiManager.request(url: url, parameters: nil, headers: nil, method: .get, encoding: JSONEncoding.default) { (data) in
            if let model = Mapper<IndexList>().map(JSON: data) {
                completion(model)
            }
            
            
        }
    }
    
    

}
