//
//  DashboardService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/13/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class DashboardService {
    
    var DashboardData = [Dashboard]()
    var data = [String:Any]()
    
    func fetchDashboard(completion: @escaping ([Dashboard]) -> ()) {
        let url = URL(string: "http://www.zeronebits.com/zerone_bits/topStocksBySharesTraded.php")
        ApiManager.shared.fetchData(url: url!, completion: {
            (data) in
            let dataValues = data["data"] as? [[String]]
            for values in dataValues ?? [[String]]() {
                self.data["sym"] = values[0]
                self.data["volume"] = values[1]
                self.data["cost"] = values[2]
                if let dashboard = Mapper<Dashboard>().map(JSON: self.data) {
                    self.DashboardData.append(dashboard)
                }
            }
            completion(self.DashboardData)
        })
    }
}
