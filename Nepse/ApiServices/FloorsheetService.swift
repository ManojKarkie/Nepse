//
//  FloorsheetService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/13/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import SwiftyJSON

class FloorsheetService: ApiServiceType {
    
    var data = [String:Any]()
    
    func fetchFloorsheet(pageUrl: String ,completion: @escaping (FloorsheetList) -> ()){
        let url = self.baseUrl + pageUrl
        self.apiManager.request(url: url, parameters: nil, headers: nil, method: .get, encoding: URLEncoding.default) { (data) in
            if let model = Mapper<FloorsheetList>().map(JSON: data){
                completion(model)
            }
            
        }
    }
    
}
