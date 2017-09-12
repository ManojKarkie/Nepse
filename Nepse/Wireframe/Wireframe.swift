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
 
}

struct StoryboardNames {
    static let sideMenu = "SideMenu"
    static let dashboard = "Dashboard"
    static let floorsheet = "Floorsheet"
    static let liveTrading = "LiveTrading"
    static let calculator = "Calculator"
    static let login = "Login"
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

    
}

extension Wireframe: SideMenu {
    
    func openDashboard() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getDashboard()]
    }
    
    func openFloorsheet() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getFloorsheet()]
    }
    
    func openLiveTrading() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getLiveTrading()]
    }
    
    func openCalculator() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getCalculator()]
    }
}
