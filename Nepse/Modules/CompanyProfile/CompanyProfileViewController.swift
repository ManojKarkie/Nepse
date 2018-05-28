//
//  CompanyProfileViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/29/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class CompanyProfileViewController: ButtonBarPagerTabStripViewController {
    
    struct Constants {
        static let barColor = UIColor.white
    }
    
    var companyCode: String?
    
    override func viewDidLoad() {
        setupBar()
        super.viewDidLoad()
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat,
            changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.init(hex: "#0077B5")
            newCell?.label.textColor = UIColor.init(hex: "#0077B5")
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let basicInfo = Wireframe.shared.getBasicInfo()
        basicInfo.companyCode = self.companyCode
        let floorsheet = Wireframe.shared.getCompanyFloorsheet()
        floorsheet.companyCode = self.companyCode
        let dividend = Wireframe.shared.getCompanyDividend()
        dividend.prflCode = self.companyCode
        return [basicInfo, Wireframe.shared.getCompanyHistory(), floorsheet , dividend , Wireframe.shared.getCompanyNews()]
    }
    
    private func setupBar() {
        settings.style.buttonBarBackgroundColor = Constants.barColor
        settings.style.buttonBarItemBackgroundColor = Constants.barColor
        settings.style.selectedBarBackgroundColor = UIColor.init(hex: "#0077B5")
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 15)
        settings.style.selectedBarHeight = 3.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = UIColor.init(hex: "#0077B5")
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarHeight = 60
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
    }

}
