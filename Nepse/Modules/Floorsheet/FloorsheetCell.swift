//
//  FloorsheetCell.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/8/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit

class FloorsheetCell: UITableViewCell {

    @IBOutlet weak var unit: UILabel!
    @IBOutlet weak var seller: UILabel!
    @IBOutlet weak var buyer: UILabel!
    @IBOutlet weak var sym: UILabel!
    @IBOutlet weak var rate: UILabel!

    var getSymbolName:((String) -> ())?
    var data: FloorsheetData?
    
    override func awakeFromNib() {
        self.sym.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapSymbol)))
        self.sym.isUserInteractionEnabled = true
    }
    
    func setup() {
        self.unit.text = data?.units
        self.seller.text = data?.seller
        self.buyer.text = data?.buyer
        self.sym.underline(text: data?.prflCode ?? "")
        
        self.rate.text = data?.rate
        
    }
    
    @objc private func didTapSymbol() {
        getSymbolName?(self.sym.text ?? "")
    }
    
}

extension UILabel {
    
    func underline(text: String) {
        self.attributedText = NSAttributedString(string: text, attributes:
            [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
    }
    
    func underlineWithTapGesture(text: String, action: Selector?) {
        self.attributedText = NSAttributedString(string: text, attributes:
            [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: action))
    }

}
