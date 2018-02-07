//
//  ChartViewControllerViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/25/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ChartViewControllerViewController: ButtonBarPagerTabStripViewController {

 
    struct Constants {
        static let barColor = UIColor.init(hex: "#2D6687")
    }
    
    override func viewDidLoad() {
        setupBar()
        super.viewDidLoad()
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat,
            changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .white
            newCell?.label.textColor = .white
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return status == .loggedIn ? [Wireframe.shared.getCompanyPortfolio(), Wireframe.shared.getProtfolioaIndex(), Wireframe.shared.getProtfolioIssueType()] :
            [Wireframe.shared.getIndexView(), Wireframe.shared.getSubIndexView(), Wireframe.shared.getCompanyView()]
    }
    
    private func setupBar() {
        settings.style.buttonBarBackgroundColor = Constants.barColor
        settings.style.buttonBarItemBackgroundColor = Constants.barColor
        settings.style.selectedBarBackgroundColor = UIColor.init(hex: "#90EAD7")
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 15)
        settings.style.selectedBarHeight = 3.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .white
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarHeight = 60
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
    }
}
