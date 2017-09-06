//
//  LGSideMenuWireframe.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/6/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import Foundation
import UIKit
import LGSideMenuController

class LGSideMenuWireframe {
    
    var view: UIViewController!
    var storyboardName: String  = ""
    
    func getMainView() -> UIViewController {
        
        let home = Wireframe.shared.getDashboard()
        let leftMenu = Wireframe.shared.getSideMenu()
        let homeNav = UINavigationController(rootViewController: home)
        homeNav.navigationBar.barTintColor = UIColor(red: 35/255.0, green: 78/255.0, blue: 102/255.0, alpha: 1)
        let slideMenuController = LGSideMenuController(rootViewController: homeNav, leftViewController: leftMenu, rightViewController: nil)
        self.view = slideMenuController
        return slideMenuController
    }
}
