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
        topView.layer.borderColor = UIColor.lightGray.cgColor
        topView.layer.cornerRadius = 5
        topView.layer.shadowColor = UIColor.lightGray.cgColor
        topView.layer.shadowRadius = 4
        topView.layer.shadowOffset = CGSize(width: 0, height: 0)
        topView.layer.shadowOpacity = 0.70
        topView.layer.borderWidth = 0.25
        bottomBuy.layer.borderColor = UIColor.lightGray.cgColor
        bottomBuy.layer.cornerRadius = 5
        bottomBuy.layer.shadowColor = UIColor.lightGray.cgColor
        bottomBuy.layer.shadowRadius = 4
        bottomBuy.layer.shadowOffset = CGSize(width: 0, height: 0)
        bottomBuy.layer.shadowOpacity = 0.70
        bottomBuy.layer.borderWidth = 0.25
        
        bottomSell.layer.borderColor = UIColor.lightGray.cgColor
        bottomSell.layer.cornerRadius = 5
        bottomSell.layer.shadowColor = UIColor.lightGray.cgColor
        bottomSell.layer.shadowRadius = 4
        bottomSell.layer.shadowOffset = CGSize(width: 0, height: 0)
        bottomSell.layer.shadowOpacity = 0.70
        bottomSell.layer.borderWidth = 0.25
        
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
