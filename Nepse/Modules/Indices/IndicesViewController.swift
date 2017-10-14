//
//  IndicesViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 10/14/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit
import Charts

class IndicesViewController: UIViewController {

    @IBOutlet weak var chartViewContainer: UIView!
    
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    //Market SUmmary Data Outlets
    
    @IBOutlet weak var turnOverLabel: UILabel!
    @IBOutlet weak var tradedSharesLabel: UILabel!
    @IBOutlet weak var transactionLabel: UILabel!
    @IBOutlet weak var scriptsTradedLabel: UILabel!
    @IBOutlet weak var totalMarketLabel: UILabel!
    @IBOutlet weak var floatedMarketLabel: UILabel!
    
    
    let service = IndicesService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func fetchMarketData() {
        service.fetchMarketSummary()
    }
    

}
