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
    
    func fetchDashboard(completion: @escaping () -> ()) {
        let url = URL(string: "http://www.zeronebits.com/zerone_bits/topStocksBySharesTraded.php")
        ApiManager.shared.fetchData(url: url!, completion: {
            (data) in
            
        })
    }
}
