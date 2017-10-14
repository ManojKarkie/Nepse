//
//  IndicesService.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 10/14/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation

class IndicesService: ApiManager {
    
    
    
    func fetchMarketSummary(){
        let url = URL(string: "http://www.zeronebits.com/nepse/data/nepseStat/MarketSummary.php")
        self.fetchData(url: url) { (data) in
            print(data)
        }
    }
}
