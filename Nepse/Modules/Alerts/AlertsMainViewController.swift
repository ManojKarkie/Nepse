//
//  AlertsMainViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/7/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class AlertsMainViewController: ButtonBarPagerTabStripViewController {

     @IBOutlet weak var barButtonView: ButtonBarView!
    
    struct Constants {
        static let barColor = UIColor.init(hex: "#2D6687")
    }
    
    override func viewDidLoad() {
        setupBar()
        self.title = "Alerts"
        super.viewDidLoad()
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat,
            changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .white
            newCell?.label.textColor = .white
        }
        if status != .notLogged {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ios7-keypad"), style: .plain, target: self, action: #selector(self.showSideMenu))
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [Wireframe.shared.getAlerts(), Wireframe.shared.getAlertsNews()]
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
