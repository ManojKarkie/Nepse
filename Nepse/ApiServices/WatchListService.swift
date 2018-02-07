//
//  WatchListService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/7/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

class WatchListService: ApiServiceType {
    
    func fetchWatchList(_ code: String, success: @escaping (WatchListData) -> ()) {
        let url = self.baseUrl + "api/v1/watch-list"
        self.apiManager.requestArray(url: url, parameters: ["CSTM_CODE": code], headers: ["Authorization": "Bearer" + (AuthNormalModel.shared.token ?? "")], method: .get, encoding: URLEncoding.default) { (response) in
            let data = ["data": response]
            if let watchListArray = Mapper<WatchListData>().map(JSON: data) {
                success(watchListArray)
            }
        }
    }
    
    func addWatchList(_ code: String, prflCode: String, success: @escaping (String) -> (), failure: @escaping (Error) -> ()) {
        let url = self.baseUrl + "api/v1/watch-list"
        self.apiManager.request(url: url, parameters: ["CSTM_CODE": code, "PRFL_CODE": prflCode], headers: ["Authorization": "Bearer" + (AuthNormalModel.shared.token ?? "")], method: .post, encoding: JSONEncoding.default, success: { (response) in
            success(response["message"] as! String)
        }) { (error) in
            failure(error)
        }
    }
}
