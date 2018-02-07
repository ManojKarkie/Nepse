//
//  AlertService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/7/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

class AlertService: ApiServiceType {
    
    func addAlert(_ code: String, _ prflCode: String, _ alertCode: String, success: @escaping (String) -> (), failure: @escaping (Error) -> ()) {
        let url = self.baseUrl + "/api/v1/alrt-cstm-dtl"
        let param = ["CSTM_CODE": code , "PRFL_CODE": prflCode, "ALRT_CODE": alertCode]
        self.apiManager.request(url: url, parameters: param, headers: ["Authorization": "Bearer" + (AuthNormalModel.shared.token ?? "")], method: .post, encoding: JSONEncoding.default, success: { (response) in
            success(response["message"] as! String)
        }) { (error) in
            failure(error)
        }
    }
    
    func fetchAlertCode(success: @escaping (AlertCodeList) -> ()) {
        let url = self.baseUrl + "api/v1/alrt"
        self.apiManager.requestArray(url: url, parameters: nil, headers: nil, method: .get, encoding: URLEncoding.default) { (response) in
            let data = ["data": response] as [String: Any]
            if let array = Mapper<AlertCodeList>().map(JSON: data) {
                success(array)
            }
        }
    }
    
    func fetchAlerts(success: @escaping (AlertList) -> ()) {
        let url = self.baseUrl + "/api/v1/alrt-cstm"
        let param = ["CSTM_CODE" : UserModel.shared.code ?? ""]
        self.apiManager.requestArray(url: url, parameters: param, headers: ["Authorization": "Bearer" + (AuthNormalModel.shared.token ?? "")], method: .get, encoding: URLEncoding.default) { (response) in
            let data = ["data" : response]
            if let alertData = Mapper<AlertList>().map(JSON: data) {
                success(alertData)
            }
        }
    }
}
