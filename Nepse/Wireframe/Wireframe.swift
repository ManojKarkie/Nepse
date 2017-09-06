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
}

struct StoryboardNames {
    static let sideMenu = "SideMenu"
    static let dashboard = "Dashboard"
}

class Wireframe {
    
    static let shared = Wireframe()
    
    func getDashboard() -> DashboardViewController {
        return UIStoryboard.init(name: StoryboardNames.dashboard, bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
    }
    
    func getSideMenu() -> SideMenuViewController {
        return UIStoryboard(name: StoryboardNames.sideMenu, bundle: nil).instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
    }
}

extension Wireframe: SideMenu {
    
    func openDashboard() {
        let sideMenu = UIApplication.shared.keyWindow?.rootViewController?.sideMenuController?.rootViewController as? UINavigationController
        sideMenu?.viewControllers = [getDashboard()]
    }
}
