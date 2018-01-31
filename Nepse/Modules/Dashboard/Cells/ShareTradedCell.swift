//
//  ShareTradedCell.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/26/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit

class ShareTradedCell: UITableViewCell {

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var lptLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    var data: [String]?
    
    func setup() {
        symbolLabel.text = data?[0]
        lptLabel.text = data?[1]
        percentLabel.text = data?[2]
    }
}
