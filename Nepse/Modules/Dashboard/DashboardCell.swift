//
//  DashboardCell.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/6/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit

class DashboardCell: UITableViewCell {

    @IBOutlet weak var profitLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var symDataLabel: UILabel!
    
    var data: Dashboard?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup() {
//        symDataLabel.text = data?.sym
//        volumeLabel.text = data?.volume
//        costLabel.text = data?.cost
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
