//
//  AlertsCell.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/7/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit

class AlertsCell: UITableViewCell {

    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var data: String?
    var alert: Alert?
    func setup() {
        descriptionView.slightlyCurved()
        self.descriptionLabel.text = data
    }
}
