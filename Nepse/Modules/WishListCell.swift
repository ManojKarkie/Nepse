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
    @IBOutlet weak var txt_Vol: UILabel!
    @IBOutlet weak var PreviousText: UILabel!
    @IBOutlet weak var txt_previousClose: UILabel!
    @IBOutlet weak var DiffText: UILabel!
    @IBOutlet weak var txt_Diff: UILabel!
    @IBOutlet weak var LowText: UILabel!

    @IBOutlet weak var txt_Low: UILabel!
    @IBOutlet weak var HighText: UILabel!
    @IBOutlet weak var txt_High: UILabel!
    @IBOutlet weak var LtpText: UILabel!
    @IBOutlet weak var wishView: UIView!
    
    @IBOutlet weak var bankTitle: UILabel!
    
    @IBOutlet weak var txt_Ltp: UILabel!
    
    @IBOutlet weak var txt_bank: UILabel!
    
    @IBOutlet weak var txtSymbol: UILabel!
    
    
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
    }

}
