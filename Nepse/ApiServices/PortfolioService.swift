//
//  PortfolioService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/22/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class PortfolioService: ApiServiceType {
    
    func fetchPortfolio(success: @escaping (PortfolioArrayModel) -> (), failure: @escaping (Error) -> ()) {
        let url = self.baseUrl + "api/v1/portfolio-by-company-profile"
        self.apiManager.request(url: url, parameters: nil, headers: ["Authorization" : AuthNormalModel.shared.token ?? ""], method: .get, encoding: URLEncoding.default, success: { (response) in
            if let data = Mapper<PortfolioArrayModel>().map(JSON: response) {
                success(data)
            }
        }) { (error) in
            failure(error)
        }
    }
}
