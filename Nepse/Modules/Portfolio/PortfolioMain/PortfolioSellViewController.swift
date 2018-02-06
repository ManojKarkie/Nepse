//
//  PortfolioSellViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/6/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class PortfolioSellViewController: UIViewController , IndicatorInfoProvider{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Sell")
    }

}
