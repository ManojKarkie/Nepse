//
//  PortfolioService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/22/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class PortfolioService: ApiServiceType {
    
    func fetchPortfolio(success: @escaping ([PortfolioModel]) -> ()) {
        let url = self.baseUrl + "api/v1/portfolio-by-company-profile"
//        self.apiManager.request(url: url, parameters: nil, headers: nil, method: .get) { (response) in
//            let data = ["data": response] as [String:Any]
//            //let modelArray = Mapper<PortfolioArray>().map(JSON: data)
////            if let dataArray = modelArray?.normalModelArray().data {
////                success(dataArray)
////            }
//        }
    }
}
