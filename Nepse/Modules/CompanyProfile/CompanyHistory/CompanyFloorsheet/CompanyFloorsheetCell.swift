//
//  CompanyFloorsheetCell.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/30/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit

class CompanyFloorsheetCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var buyerCell: UILabel!
    @IBOutlet weak var sellerLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    var model: FloorsheetData?
    
    func setup() {
        self.dateLabel.text = model?.date ?? ""
        self.buyerCell.text = model?.buyer
        self.sellerLabel.text = model?.seller
        self.unitLabel.text = model?.units
        self.rateLabel.text = model?.rate
    }
}
