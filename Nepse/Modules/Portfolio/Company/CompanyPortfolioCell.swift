//
//  CompanyPortfolioCell.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/4/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit

class CompanyPortfolioCell: UITableViewCell {

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var unitsLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    var model: Portfolio?
    
    func setup() {
        self.symbolLabel.text = model?.prflCode
        self.unitsLabel.text = model?.units
        self.valueLabel.text = model?.value
    }
}
