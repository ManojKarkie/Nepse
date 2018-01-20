//
//  LiveTradingService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/13/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class LiveTradingService {
    
    var liveTradingData = [LiveTrading]()
    var data = [String:Any]()
    
    func fetchLiveTrading(completion: @escaping ([LiveTrading]) -> ()){
        let url = URL(string: "http://www.zeronebits.com/nepse/liveTrading.20170901.171437.php")
//        ApiManager.shared.fetchData(url: url!, completion: {
//            (data) in
//            let dictionaryValue = data as NSDictionary
//            let keys = dictionaryValue.allKeys as? [String]
//            for key in keys ?? [String]() {
//                if let array = dictionaryValue[key] as? [String]{
//                    self.data["sn"] = array[0]
//                    self.data["contact"] = array[1]
//                    self.data["sym"] = array[2]
//                    self.data["buyer"] = array[3]
//                    self.data["seller"] = array[4]
//                    self.data["qty"] = array[5]
//                    let liveTrade = Mapper<LiveTrading>().map(JSON: self.data)
//                    self.liveTradingData.append(liveTrade!)
//                }
//            }
//            completion(self.liveTradingData)
//        })
    }
}
