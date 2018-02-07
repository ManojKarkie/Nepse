//
//  WishListCell.swift
//  Nepse
//
//  Created by Rojan on 9/9/2560 BE.
//  Copyright © 2560 Swiftech. All rights reserved.
//

import UIKit

class WishListCell: UITableViewCell {
    
    @IBOutlet weak var TitleLineView: UIView!
    @IBOutlet weak var VolText: UILabel!

    @IBOutlet weak var PreviousText: UILabel!

    @IBOutlet weak var DiffText: UILabel!

    @IBOutlet weak var LowText: UILabel!


    @IBOutlet weak var HighText: UILabel!

    @IBOutlet weak var LtpText: UILabel!
    @IBOutlet weak var wishView: UIView!
    
    @IBOutlet weak var bankTitle: UILabel!
    
    @IBOutlet weak var txt_bank: UILabel!
    

    
    var model: WatchList?
    var bankName: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(){
        self.wishView.layer.borderWidth = 1.0
        self.wishView.layer.borderColor = UIColor.gray.cgColor
        self.wishView.layer.cornerRadius = 10.0
        self.VolText.text =  "\(model?.liveTrading?.volume ?? 0)"
        self.PreviousText.text = model?.liveTrading?.close
        self.DiffText.text = model?.liveTrading?.diffVal
        self.LowText.text = model?.liveTrading?.low
        self.HighText.text = model?.liveTrading?.high
        self.LtpText.text = model?.liveTrading?.turnover
        self.bankTitle.text = bankName ?? ""
        self.txt_bank.text = model?.prflCode ?? ""
    }

}
