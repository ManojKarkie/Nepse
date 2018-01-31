//
//  CompanyHistoryViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/30/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class CompanyHistoryViewController: UIViewController, IndicatorInfoProvider {
    @IBOutlet weak var monthBtn: UIButton!
    @IBOutlet weak var month3Btn: UIButton!
    @IBOutlet weak var month6Btn: UIButton!
    @IBOutlet weak var month12Btn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.containerView.getBorder()
        self.monthBtn.setButton()
        self.month3Btn.setButton()
        self.month6Btn.setButton()
        self.month12Btn.setButton()
    }
    
    @IBAction func monthBtnAction(_ sender: UIButton) {
        switch sender {
        case monthBtn:
            
            sender.selectBtn()
            month3Btn.unSelectBtn()
            month6Btn.unSelectBtn()
            month12Btn.unSelectBtn()
            break
        case month3Btn:
        
            sender.selectBtn()
            monthBtn.unSelectBtn()
            month6Btn.unSelectBtn()
            month12Btn.unSelectBtn()
            break
        case month6Btn:
       
            sender.selectBtn()
            monthBtn.unSelectBtn()
            month3Btn.unSelectBtn()
            month12Btn.unSelectBtn()
            break
        case month12Btn:
          
            sender.selectBtn()
            monthBtn.unSelectBtn()
            month3Btn.unSelectBtn()
            month6Btn.unSelectBtn()
            break
        default:
            break
        }
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "HISTORY")
    }
}
