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

class LGSideMenuWireframe: WireframeInput {
    
    var view: UIViewController!
    static var shared = LGSideMenuWireframe()
    var storyboardName: String  = ""
    var home: UIViewController?
    func getMainView() -> UIViewController {
        
        let home = self.home
        let leftMenu = Wireframe.shared.getSideMenu()
        let homeNav = UINavigationController(rootViewController: home ?? UIViewController())
        homeNav.navigationBar.barTintColor = UIColor(red: 35/255.0, green: 78/255.0, blue: 102/255.0, alpha: 1)
        let slideMenuController = LGSideMenuController(rootViewController: homeNav, leftViewController: leftMenu, rightViewController: nil)
        self.view = slideMenuController
        return slideMenuController
    }
}
