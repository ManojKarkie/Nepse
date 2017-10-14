//
//  PortfolioViewController.swift
//  Nepse
//
//  Created by Rojan on 9/20/2560 BE.
//  Copyright © 2560 Swiftech. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController {

    @IBOutlet weak var shares: UILabel!
    @IBOutlet weak var shareAddedView: UIView!
    @IBOutlet weak var shrebgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func setUp(){
        self.title = "Portfolio"
        shrebgView.layer.cornerRadius = shrebgView.frame.size.height/2
        shareAddedView.layer.cornerRadius = shareAddedView.frame.size.height/2
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ios7-keypad"), style: .plain, target: self, action: #selector(sideMenuController?.showLeftViewAnimated))
    }
    

}

class corneredButton : UIButton {
    
    override func awakeFromNib() {
        layer.cornerRadius = 5
    }
}
