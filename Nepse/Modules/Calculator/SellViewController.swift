//
//  SellViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/19/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit

class SellViewController: UIViewController {

    
    @IBOutlet weak var calculateBtn: UIButton!
    @IBOutlet weak var bottomSell: UIView!
    @IBOutlet weak var bottomBuy: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var buyView: UIView!
    @IBOutlet weak var sellView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        buyView.layer.borderColor = UIColor.lightGray.cgColor
        buyView.layer.borderWidth = 0.25
        
        sellView.layer.borderColor = UIColor.lightGray.cgColor
        sellView.layer.borderWidth = 0.25
        
        calculateBtn.layer.cornerRadius = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
