//
//  DashboardService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/13/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class DashboardService : ApiServiceType{
    
    var DashboardData = [Dashboard]()
    var TransactionData = [Transactions]()
    var data = [String:Any]()
    
    func fetchDashboard(completion: @escaping ([Dashboard]) -> ()) {
        let url = URL(string: "http://www.zeronebits.com/zerone_bits/topStocksBySharesTraded.php")
//        ApiManager.shared.fetchData(url: url!, completion: {
//            (data) in
//            let dataValues = data["data"] as? [[String]]
//            for values in dataValues ?? [[String]]() {
//                self.data["sym"] = values[0]
//                self.data["volume"] = values[1]
//                self.data["cost"] = values[2]
//                if let dashboard = Mapper<Dashboard>().map(JSON: self.data) {
//                    self.DashboardData.append(dashboard)
//                }
//            }
//            completion(self.DashboardData)
//        })
    }
    
    func fetchNumberOfShareTransaction(completion: @escaping ([Transactions]) -> ()) {
        let url = URL(string: "http://www.zeronebits.com/nepse/data/performers/Top10ByTxn.php")
//        self.fetchData(url: url!) { (data) in
//            let apiData = data as NSDictionary
//            var dataArray = apiData.allValues as? [[String]]
//            dataArray?.remove(at: 0)
//            for values in dataArray ?? [[String]]() {
//                self.data["sym"] = values[0]
//                self.data["numberOfTransactions"] = values[1]
//                self.data["closingPrice"] = values[2]
//                if let transaction = Mapper<Transactions>().map(JSON: self.data) {
//                    self.TransactionData.append(transaction)
//                }
//            }
//            completion(self.TransactionData)
//        }
    }
}
