//
//  PortfolioMainViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/6/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class PortfolioMainViewController: ButtonBarPagerTabStripViewController {

    @IBOutlet weak var barButtonView: ButtonBarView!
    
    struct Constants {
        static let barColor = UIColor.init(hex: "#0077B5")
    }
    override func viewDidLoad() {
        setupBar()
        super.viewDidLoad()
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat,
            changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.white
            newCell?.label.textColor = UIColor.white
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [Wireframe.shared.getProtfolioBuy(), Wireframe.shared.getProtfolioSell()]
    }
    
    private func setupBar() {
        settings.style.buttonBarBackgroundColor = Constants.barColor
        settings.style.buttonBarItemBackgroundColor = Constants.barColor
        settings.style.selectedBarBackgroundColor = UIColor.white
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 15)
        settings.style.selectedBarHeight = 3.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = UIColor.white
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarHeight = 60
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
    }

}
