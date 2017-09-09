//
//  CalculatorViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/8/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var sellUnderline: UIView!
    @IBOutlet weak var buyUnderline: UIView!
    @IBOutlet weak var bottomInnerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }

    func setup() {
        topView.layer.borderColor = UIColor.lightGray.cgColor
        topView.layer.cornerRadius = 5
        topView.layer.shadowColor = UIColor.lightGray.cgColor
        topView.layer.shadowRadius = 2
        topView.layer.shadowOffset = CGSize(width: 0, height: 0)
        topView.layer.shadowOpacity = 0.50
        topView.layer.borderWidth = 1
        sellUnderline.isHidden = true
        bottomView.layer.borderColor = UIColor.lightGray.cgColor
        bottomView.layer.cornerRadius = 5
        bottomView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomView.layer.shadowRadius = 2
        bottomView.layer.shadowOffset = CGSize(width: 0, height: 0)
        bottomView.layer.shadowOpacity = 0.50
        bottomView.layer.borderWidth = 1
        bottomInnerView.layer.borderColor = UIColor.lightGray.cgColor
        bottomInnerView.layer.borderWidth = 1
    }
    
    @IBAction func buyBtnTapped(_ sender: Any) {
        sellUnderline.isHidden = true
        buyUnderline.isHidden = false
    }
    
    @IBAction func sellBtnTapped(_ sender: Any) {
        sellUnderline.isHidden = false
        buyUnderline.isHidden = true

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
