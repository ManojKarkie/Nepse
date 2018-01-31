//
//  LiveTradingService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/13/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import SwiftyJSON

class LiveTradingService: ApiServiceType {
    
    func fetchLiveTrading(completion: @escaping (LiveTrading) -> ()){
        let url = self.baseUrl + "api/v1/livetrading"
        self.apiManager.request(url: url, parameters: nil, headers: nil, method: .get, encoding: JSONEncoding.default) { (response) in
            if let model = Mapper<LiveTrading>().map(JSON: response) {
                completion(model)
            }
        }
    }
}
