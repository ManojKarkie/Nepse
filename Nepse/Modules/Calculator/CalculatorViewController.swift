//
//  CalculatorViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/8/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var buyView: UIView!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var buyUnderline: UIView!
    @IBOutlet weak var bottomInnerView: UIView!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var sellBtn: UIButton!
    
    enum calculateType {
        case buy
        case sell
    }
    
    var controller = SellViewController()
    var defaultType: calculateType = .buy
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        self.title = "Calculator"
        topView.layer.borderColor = UIColor.lightGray.cgColor
        topView.layer.cornerRadius = 5
        topView.layer.shadowColor = UIColor.lightGray.cgColor
        topView.layer.shadowRadius = 4
        topView.layer.shadowOffset = CGSize(width: 0, height: 0)
        topView.layer.shadowOpacity = 0.70
        topView.layer.borderWidth = 0.25
        bottomView.layer.borderColor = UIColor.lightGray.cgColor
        bottomView.layer.cornerRadius = 5
        bottomView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomView.layer.shadowRadius = 4
        bottomView.layer.shadowOffset = CGSize(width: 0, height: 0)
        bottomView.layer.shadowOpacity = 0.70
        bottomView.layer.borderWidth = 0.25
        bottomInnerView.layer.borderWidth = 1
        bottomInnerView.layer.borderColor = UIColor(hex: "#E3E3E3").cgColor
        buyBtn.frame.size.width = buttonView.frame.size.width/2
        sellBtn.frame.size.width = buttonView.frame.size.width/2
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(sideMenuController?.showLeftViewAnimated))
        sideMenuController?.swipeGestureArea = .full
        calculateButton.layer.cornerRadius = 4
        buttonView.layer.cornerRadius = 4
        sellBtn.layer.cornerRadius = 4
        buyBtn.layer.cornerRadius = 4
    }
    
    @IBAction func buyBtnTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            if self.defaultType != .buy{
                self.buyUnderline.center.x = self.buyUnderline.bounds.width - (self.buttonView.bounds.width/4)
                self.defaultType = .buy
                self.controller.view.isHidden = true
            }
        }) { _ in
        }
    }
    
    @IBAction func sellBtnTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            if self.defaultType != .sell{
                self.buyUnderline.center.x += self.buyUnderline.bounds.width
                self.defaultType = .sell
                self.viewSell()
            }
        }) { _ in
        }
    }
    
    func viewSell() {
        controller = self.storyboard?.instantiateViewController(withIdentifier: "SellViewController") as! SellViewController
        self.addChildViewController(controller)
        controller.view.frame = self.buyView.frame
        controller.view.frame.size.width = self.view.frame.size.width
        self.buyView.addSubview((controller.view)!)
        controller.didMove(toParentViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
