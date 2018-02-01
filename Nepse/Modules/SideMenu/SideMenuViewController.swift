//
//  SideMenuViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/5/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit
import LGSideMenuController

class SideMenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sideMenuController?.hideLeftViewAnimated()
        switch indexPath.row {
        case 0:
            Wireframe.shared.openDashboard()
        case 1:
            Wireframe.shared.openFloorsheet()
        case 2:
            Wireframe.shared.openLiveTrading()
        case 3:
            Wireframe.shared.openProfile()
        case 4:
            Wireframe.shared.openPortfolio()
        case 5:
            Wireframe.shared.openWatchList()
        case 7:
            Wireframe.shared.openIndices()
        case 8:
            Wireframe.shared.openCalculator()
        default:
            break
        }
    }
    

}
