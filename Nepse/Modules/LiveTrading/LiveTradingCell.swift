//
//  LiveTradingCell.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/8/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit

class LiveTradingCell: UITableViewCell {

    
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var seller: UILabel!
    @IBOutlet weak var buyer: UILabel!
    @IBOutlet weak var sym: UILabel!
    @IBOutlet weak var contact: UILabel!
    @IBOutlet weak var sn: UILabel!
    
    var data: LiveTrading?
    var index: Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup() {
        qty.text = data?.quantity
        seller.text = data?.seller
        buyer.text = data?.buyer
        sym.text = data?.sym
        contact.text = data?.contactNum
        sn.text = data?.sn
        if (index ?? 0) % 2 == 0{
            self.contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
