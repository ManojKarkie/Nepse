//
//  IndicesService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 10/14/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class IndicesService: ApiManager {
    
    var indexSummaryDic = [String: Any]()
    var indexSummaryData = [IndexSummary]()
    func fetchMarketSummary(completion: @escaping (MarketSummary) -> ()){
        let url = URL(string: "http://www.zeronebits.com/nepse/data/nepseStat/MarketSummary.php")
        self.fetchData(url: url!) { (data) in
            let marketData = Mapper<MarketSummary>().map(JSON: data)
            completion(marketData ?? MarketSummary())
        }
    }
    
    func fetchIndexSummary(completion: @escaping ([IndexSummary]) -> ()){
        let url = URL(string: "http://www.zeronebits.com/nepse/data/nepseStat/IndexSummary.php")
        self.fetchData(url: url!) { (data) in
            let apiData = data as NSDictionary
            var values = apiData.allValues as? [[String]]
            values?.remove(at: 1)
            for value in values ?? [[String]](){
               self.indexSummaryDic["index"] = value[0]
                self.indexSummaryDic["turnover"] = value[1]
                self.indexSummaryDic["current"] = value[2]
                self.indexSummaryDic["pointChange"] = value[3]
                self.indexSummaryDic["percent"] = value[4]
                self.indexSummaryDic["trend"] = value[5]
                let index = Mapper<IndexSummary>().map(JSON: self.indexSummaryDic)
                self.indexSummaryData.append(index ?? IndexSummary())
            }
            completion(self.indexSummaryData)
        }
    }
    
    
}
