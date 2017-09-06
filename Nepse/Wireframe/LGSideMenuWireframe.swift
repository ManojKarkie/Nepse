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
        
        let slideMenuController = LGSideMenuController(rootViewController: homeNav, leftViewController: leftMenu, rightViewController: nil)
        self.view = slideMenuController
        return slideMenuController
    }
}
