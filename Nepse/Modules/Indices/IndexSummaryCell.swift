//
//  IndexSummaryCell.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 10/15/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit

class IndexSummaryCell: UITableViewCell {

    @IBOutlet weak var trendLabel: UILabel!
    @IBOutlet weak var percetnLabel: UILabel!
    @IBOutlet weak var pointChangeLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var turnOverLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    
    var data: IndexSummary?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup() {
        indexLabel.text = data?.index
        percetnLabel.text = data?.percent
        pointChangeLabel.text = data?.pointChange
        currentLabel.text = data?.current
        turnOverLabel.text = data?.turnover
        trendLabel.text = data?.trend
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
