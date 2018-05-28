//
//  Wireframe.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/6/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import UIKit
import LGSideMenuController

protocol SideMenu {
    func openDashboard()
    func openFloorsheet()
    func openLiveTrading()
    func openCalculator()
    func openMain()
    func openWatchList()
    func openLogin()
    func openPortfolio()
    func openIndices()
    func openProfile()
}

struct StoryboardNames {
    static let sideMenu = "SideMenu"
    static let dashboard = "Dashboard"
    static let floorsheet = "Floorsheet"
    static let liveTrading = "LiveTrading"
    static let calculator = "Calculator"
    static let login = "Login"
    static let main = "Main"
    static let watchList = "WishList"
    static let portfolio = "Portfolio"
    static let registration = "Register"
    static let indices = "Indices"
    static let companyProfile = "CompanyProfile"
    static let briefInfo = "BriefInfo"
    static let companyFloorsheet = "CompanyFloorSheet"
    static let companyHistory = "CompanyHistory"
    static let companyDividend = "CompanyDividend"
    static let companyNews = "CompanyNews"
    static let profile = "Profile"
    static let alerts = "Alerts"
    static let userProfile = "UserProfile"
}

class Wireframe {
    
    static let shared = Wireframe()
    
    func getDashboard() -> DashboardViewController {
        return UIStoryboard.init(name: StoryboardNames.dashboard, bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
    }
    
    func getSideMenu() -> SideMenuViewController {
        return UIStoryboard(name: StoryboardNames.sideMenu, bundle: nil).instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
    }
    
    func getFloorsheet() -> FloorsheetViewController {
        return UIStoryboard(name: StoryboardNames.floorsheet, bundle: nil).instantiateViewController(withIdentifier: "FloorsheetViewController") as! FloorsheetViewController
    }
    
    func getLiveTrading() -> LiveTradingViewController {
        return UIStoryboard(name: StoryboardNames.liveTrading, bundle: nil).instantiateViewController(withIdentifier: "LiveTradingViewController") as! LiveTradingViewController
    }
    
    func getCalculator() -> CalculatorViewController {
        return UIStoryboard(name: StoryboardNames.calculator, bundle: nil).instantiateViewController(withIdentifier: "CalculatorViewController") as! CalculatorViewController
    }
    
    func getLogin() -> LoginViewController {
        return UIStoryboard(name: StoryboardNames.login, bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    }

    func getMain() -> ViewController {
        return UIStoryboard(name: StoryboardNames.main , bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
    }
    
    func getWatchList() -> WishlistViewController {
        return UIStoryboard(name: StoryboardNames.watchList , bundle: nil).instantiateViewController(withIdentifier: "WishlistViewController") as! WishlistViewController
    }
    
    func getProtfolio() -> PortfolioViewController {
        return UIStoryboard(name: StoryboardNames.portfolio , bundle: nil).instantiateViewController(withIdentifier: "PortfolioViewController") as! PortfolioViewController
    }
    
    func getRegister() -> RegisterViewController {
        return UIStoryboard(name: StoryboardNames.registration , bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
    }
    
    func getIndices() -> IndicesViewController {
        return UIStoryboard(name: StoryboardNames.indices , bundle: nil).instantiateViewController(withIdentifier: "IndicesViewController") as! IndicesViewController
    }
    
    func getActivateUser() -> ActivateUserViewController {
        return UIStoryboard(name: StoryboardNames.registration , bundle: nil).instantiateViewController(withIdentifier: "ActivateUserViewController") as! ActivateUserViewController
    }
    
    func getIndexView() -> IndexViewController {
        return UIStoryboard(name: StoryboardNames.dashboard , bundle: nil).instantiateViewController(withIdentifier: "IndexViewController") as! IndexViewController
    }
    
    func getSubIndexView() -> SubIndexViewController {
        return UIStoryboard(name: StoryboardNames.dashboard , bundle: nil).instantiateViewController(withIdentifier: "SubIndexViewController") as! SubIndexViewController
    }
    
    func getCompanyView() -> CompanyViewController {
        return UIStoryboard(name: StoryboardNames.dashboard , bundle: nil).instantiateViewController(withIdentifier: "CompanyViewController") as! CompanyViewController
    }
    
    func getCompanyProfile() -> CompanyProfileViewController {
        return UIStoryboard(name: StoryboardNames.companyProfile , bundle: nil).instantiateViewController(withIdentifier: "CompanyProfileViewController") as! CompanyProfileViewController
    }
    
    func getBasicInfo() -> BasicInfoViewController {
        return UIStoryboard(name: StoryboardNames.briefInfo , bundle: nil).instantiateViewController(withIdentifier: "BasicInfoViewController") as! BasicInfoViewController
    }
    
    func getCompanyHistory() -> CompanyHistoryViewController {
        return UIStoryboard(name: StoryboardNames.companyHistory , bundle: nil).instantiateViewController(withIdentifier: "CompanyHistoryViewController") as! CompanyHistoryViewController
    }
    
    func getCompanyFloorsheet() -> CompanyFloorsheetViewController {
        return UIStoryboard(name: StoryboardNames.companyFloorsheet , bundle: nil).instantiateViewController(withIdentifier: "CompanyFloorsheetViewController") as! CompanyFloorsheetViewController
    }
    
    func getCompanyDividend() -> CompanyDividendViewController {
        return UIStoryboard(name: StoryboardNames.companyDividend , bundle: nil).instantiateViewController(withIdentifier: "CompanyDividendViewController") as! CompanyDividendViewController
    }
    
    func getCompanyNews() -> CompanyNewsViewController {
        return UIStoryboard(name: StoryboardNames.companyNews , bundle: nil).instantiateViewController(withIdentifier: "CompanyNewsViewController") as! CompanyNewsViewController
    }
    
    func getProfileView() -> ProfileViewController {
        return UIStoryboard(name: StoryboardNames.profile , bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
    }
    
    func getCompanyPortfolio() -> CompanyPortfolioViewController {
        return UIStoryboard(name: StoryboardNames.portfolio , bundle: nil).instantiateViewController(withIdentifier: "CompanyPortfolioViewController") as! CompanyPortfolioViewController
    }
    
    func getProtfolioaIndex() -> IndexChartViewController {
        return UIStoryboard(name: StoryboardNames.portfolio , bundle: nil).instantiateViewController(withIdentifier: "IndexChartViewController") as! IndexChartViewController
    }
    
    func getProtfolioIssueType() -> IssueTypeViewController {
        return UIStoryboard(name: StoryboardNames.portfolio , bundle: nil).instantiateViewController(withIdentifier: "IssueTypeViewController") as! IssueTypeViewController
    }
    
    func getProtfolioBuy() -> PortfolioBuyViewController {
        return UIStoryboard(name: StoryboardNames.portfolio , bundle: nil).instantiateViewController(withIdentifier: "PortfolioBuyViewController") as! PortfolioBuyViewController
    }
    
    func getProtfolioSell() -> PortfolioSellViewController {
        return UIStoryboard(name: StoryboardNames.portfolio , bundle: nil).instantiateViewController(withIdentifier: "PortfolioSellViewController") as! PortfolioSellViewController
    }
    
    func getAlertsMain() -> AlertsMainViewController {
        return UIStoryboard(name: StoryboardNames.alerts , bundle: nil).instantiateViewController(withIdentifier: "AlertsMainViewController") as! AlertsMainViewController
    }
    
    func getAlerts() -> AlertsViewController {
        return UIStoryboard(name: StoryboardNames.alerts , bundle: nil).instantiateViewController(withIdentifier: "AlertsViewController") as! AlertsViewController
    }
    
    func getAlertsNews() -> AlertNotificationViewController {
        return UIStoryboard(name: StoryboardNames.alerts , bundle: nil).instantiateViewController(withIdentifier: "AlertNotificationViewController") as! AlertNotificationViewController
    }
    
    func getUserProfile() -> UserProfileViewController {
        return UIStoryboard(name: StoryboardNames.userProfile , bundle: nil).instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
    }

}

extension Wireframe: SideMenu {
    
    func openDashboard() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        let dashboard = getDashboard()
        sideMenu?.viewControllers = [dashboard]
    }
    
    func openFloorsheet() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        let floorsheet = getFloorsheet()
        sideMenu?.viewControllers = [floorsheet]
    }
    
    func openLiveTrading() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        let liveTrading = getLiveTrading()
        sideMenu?.viewControllers = [liveTrading]
    }
    
    func openProfile() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getProfileView()]
    }
    
    func openCalculator() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getCalculator()]
    }
    
    func openMain() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getMain()]
    }
    
    func openWatchList() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        let watchList = getWatchList()
        sideMenu?.viewControllers = [watchList]
    }
    
    func openIndices() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getIndices()]
    }
    
    func openPortfolio() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getProtfolio()]
    }
    
    func openAlerts() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getAlertsMain()]
    }
    
    func openUserProfile() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getUserProfile()]
    }
    
    func openLogin() {
        appdelegate?.window?.rootViewController = getLogin()
    }
}
