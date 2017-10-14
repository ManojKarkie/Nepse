//
//  TrunOverCell.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 10/7/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit

class TrunOverCell: UITableViewCell {

    @IBOutlet weak var closingPrice: UILabel!
    @IBOutlet weak var numberOfTransactions: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    
    var transaction: Transactions?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup() {
        closingPrice.text = transaction?.closingPrice!
        numberOfTransactions.text = transaction?.noOfTrans!
        symbolLabel.text = transaction?.sym!
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
