//
//  CompanyService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/29/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper

class CompanyService: ApiServiceType {
    
    func fetchCompanyProfile(companyCode: String, success: @escaping (CompanyProfile) -> (), failure: @escaping (Error) -> () ) {
        let url = self.baseUrl + "api/v1/company-profile"
        self.apiManager.request(url: url, parameters: ["CODE" : companyCode], headers: nil, method: .get, encoding: URLEncoding.default) { (response) in
            if let data = Mapper<CompanyProfile>().map(JSON: response) {
                success(data)
            }
        }
    }
}
