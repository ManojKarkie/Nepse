//
//  CompanyDividendService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/31/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

class CompanyDividendService: ApiServiceType {
    
    func fetchCompanyDividend(code: String, success: @escaping (CompanyDividendData) -> (), failure: @escaping () -> ()) {
        let url = self.baseUrl + "api/v1/f-dividend"
        self.apiManager.request(url: url, parameters: ["PRFL_CODE": code], headers: nil, method: .get, encoding: URLEncoding.default, success: { (response) in
            if let data = Mapper<CompanyDividendData>().map(JSON: response) {
                success(data)
            }
        }) { _ in
            
        }
    }
}
