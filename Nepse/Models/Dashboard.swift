//
//  Dashboard.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/13/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import ObjectMapper

class Dashboard: Mappable {
    
    var _top10ByLoss: [String: [String]]? {
        didSet {
            self.top10ByLoss = (_top10ByLoss?.values).map({Array($0)})
        }
    }
    var top10ByLoss: [[String]]?
    
    var _top10ByShareVolume: [String: [String]]? {
        didSet {
            self.top10ByShareVolume = _top10ByShareVolume?.values.map{Array($0)}
        }
    }
    var top10ByShareVolume: [[String]]?
    
    var _top10ByTurnOver: [String: [String]]? {
        didSet {
            self.top10ByTurnOver = _top10ByTurnOver?.values.map{Array($0)}
        }
    }
    var top10ByTurnOver: [[String]]?
    
    var _top10ByGain : [String: [String]]? {
        didSet {
            self.top10ByGain = _top10ByGain?.values.map{Array($0)}
        }
    }
    var top10ByGain: [[String]]?
    
    var indices: IndicesArray?
    var subIndices: SubIndicesArray?
    var marketSummary: MarketSummary?
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        _top10ByLoss <- map["top10ByLoss"]
        _top10ByShareVolume <- map["top10ByShareVolume"]
        _top10ByTurnOver <- map["top10ByTurnOver"]
        _top10ByGain <- map["top10ByGain"]
        indices <- map["indices"]
        subIndices <- map["subIndices"]
        marketSummary <- map["marketSummary"]
    }
}


