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
    @IBOutlet var header: UIView!
    
    @IBOutlet var header2: UIView!
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
    
    var marketSummary = MarketSummary()
    var indexData = [IndexSummary]()
    var subIndexData = [SubIndexSummary]()
    let service = IndicesService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        chartViewContainer.layer.cornerRadius = 5
        chartViewContainer.layer.borderColor = UIColor.lightGray.cgColor
        chartViewContainer.layer.borderWidth = 0.5
        fetchMarketData()
        fetchIndexSummary()
        fetchSubIndexSummary()
        tableView.delegate = self
        tableView.dataSource = self
        tableView2.delegate = self
        tableView2.dataSource = self
         self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ios7-keypad"), style: .plain, target: self, action: #selector(self.showSideMenu))
        self.title = "Indices"
    }
    
    func drawChart() {
        var chartEntries: [ChartDataEntry] = []
        for i:Int in 0 ..< subIndexData.count {
            let string = subIndexData[i].percent?.replacingOccurrences(of: " ", with: "") ?? ""
            let chartData = ChartDataEntry(x: Double(i), y: Double(string )!)
            chartEntries.append(chartData)
        }
        let chartDataSet = LineChartDataSet(values: chartEntries, label: "Sub Indices change in %")
        chartDataSet.drawFilledEnabled = true
        chartDataSet.cubicIntensity = 5
        chartView.drawGridBackgroundEnabled = false
        
        chartDataSet.valueTextColor = NSUIColor.white
        chartDataSet.drawCirclesEnabled = false
        chartDataSet.mode = .horizontalBezier
        let chartData = LineChartData(dataSet: chartDataSet)
        chartView.data = chartData
    }
    
    
    func fetchMarketData() {
        service.fetchMarketSummary { (data) in
            self.marketSummary = data
            self.setupMarketSummary()
        }
    }
    
    func fetchSubIndexSummary() {
        service.fetchSubIndexSummarry { (data) in
            self.subIndexData = data
            self.tableView2.reloadData()
            self.drawChart()
        }
    }
    
    func fetchIndexSummary() {
        service.fetchIndexSummary { (data) in
            self.indexData = data
            self.tableView.reloadData()
        }
    }
    
    func setupMarketSummary(){
//        turnOverLabel.text = marketSummary.currentIndex ?? ""
//        tradedSharesLabel.text = marketSummary.percentChange ?? ""
//        transactionLabel.text = marketSummary.totalTransactions ?? ""
//        scriptsTradedLabel.text = marketSummary.totalScripts ?? ""
//        totalMarketLabel.text = marketSummary.pointChange ?? ""
//        floatedMarketLabel.text = marketSummary.totalTraded ?? ""
    }

}

extension IndicesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        switch tableView.tag {
        case 1:
            count = indexData.count
        case 2:
            count = subIndexData.count
        default:
            break
        }
        return count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var mainCell: UITableViewCell?
        switch tableView.tag {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IndexSummaryCell") as? IndexSummaryCell
            cell?.data = indexData[indexPath.row]
            cell?.setup()
            mainCell = cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubIndexCell") as? SubIndexCell
            cell?.data = subIndexData[indexPath.row]
            cell?.setup()
            mainCell = cell
        default:
            break
        }
        
        return mainCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view:UIView?
        switch tableView.tag {
        case 1:
            view = self.header
        case 2:
            view = self.header2
        default:
            break
        }
        return view!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height: CGFloat?
        switch tableView.tag {
        case 1:
            height = 50
            break
        case 2:
            height = 50
            break
        default:
            break
        }
        
        return height!
    }
}

extension IndicesViewController: UITableViewDelegate {
    
}
