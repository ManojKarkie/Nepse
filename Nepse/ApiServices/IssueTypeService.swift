//
//  IssueTypeService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/6/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper

class IssueTypeService : ApiServiceType {
    
    func fetchIssueTypeData(success: @escaping (IssueTypeData) -> ()) {
        let url = self.baseUrl  + "api/v1/portfolio-by-issue-type-code"
        self.apiManager.requestArray(url: url, parameters: ["CSTM_CODE": UserModel.shared.code ?? ""], headers: ["Authorization" : "Bearer" + (AuthNormalModel.shared.token ?? "")], method: .get, encoding: URLEncoding.default) { (data) in
            let data = ["data" : data]
            if let issueArray = Mapper<IssueTypeData>().map(JSON: data) {
                success(issueArray)
            }
        }
    }
    
    func buyPortfolio(model: BuySellPortfolio, success: @escaping (String) -> (), failure: @escaping (Error) -> ()) {
        let url = self.baseUrl + "api/v1/cstm-prfl-prtf-buy"
        let param:[String: Any] = ["CSTM_CODE": model.cstmCode ?? "", "ISSU_TYPE_CODE":model.issuType ?? "", "BUY_UNITS": model.units ?? "", "BUY_RATE": model.rate ?? "", "PRFL_CODE": model.prflCode ?? "" ,"BUY_DT" : "" ]
        self.apiManager.request(url: url, parameters: param, headers: ["Authorization" : "Bearer " + (AuthNormalModel.shared.token ?? "")], method: .post, encoding: JSONEncoding.default, success: { (response) in
            success(response["message"] as! String)
        }) { (error) in
            failure(error)
        }
    }
    
    func sellPortfolio(model: BuySellPortfolio, success: @escaping (String) -> (), failure: @escaping (Error) -> ()) {
        let url = self.baseUrl + "api/v1/cstm-prfl-prtf-sell"
        let param = ["CSTM_CODE": model.cstmCode ?? "", "SELL_UNITS": model.units ?? "", "SELL_RATE": model.rate ?? "", "PRFL_CODE": model.prflCode ?? ""]
        self.apiManager.request(url: url, parameters: param, headers: ["Authorization" : "Bearer " + (AuthNormalModel.shared.token ?? "")], method: .post, encoding: JSONEncoding.default, success: { (response) in
            if let error = response["CSTM_CODE"] {
                let errorData = NSError(domain: "CSTM_CODE", code: 400, userInfo: [NSLocalizedDescriptionKey : error as? String ?? ""])
                failure(errorData)
            }else{
            success(response["message"] as! String)
            }
        }) { (error) in
            failure(error)
        }
    }
    
    func fetchBoughtSoldShares(success: @escaping (BoughtSoldShares) -> (), failure: @escaping (Error) -> ()) {
        let url = self.baseUrl + "api/v1/bought-sold-share"
        self.apiManager.request(url: url, parameters: ["CSTM_CODE": UserModel.shared.code ?? ""], headers: ["Authorization": "Bearer" + (AuthNormalModel.shared.token ?? "")], method: .get, encoding: URLEncoding.default, success: { (response) in
            if let data = Mapper<BoughtSoldShares>().map(JSON: response) {
                success(data)
            }
        }) { (error) in
            failure(error)
        }
    }
}
