//
//  IssueTypeViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/5/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Charts

class IssueTypeViewController: UIViewController , IndicatorInfoProvider{

    @IBOutlet weak var pieChartView: PieChartView!
    private let service = IssueTypeService()
    private var issueArray = [IssueType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Issue Type")
    }

    private func fetchData() {
        service.fetchIssueTypeData { (data) in
            if let array = data.data {
                self.issueArray = array
                self.updateChartData()
            }
        }
    }
    
    func updateChartData()  {
        // 2. generate chart data entries
        
        var entries = [PieChartDataEntry]()
        
        issueArray.forEach { (value) in
            let entry = PieChartDataEntry()
            entry.y = Double(Int(value.units?.replacingOccurrences(of: ",", with: "") ?? "") ?? 0)
            entry.label = value.issueTypeCode
            entries.append( entry)
        }
        
        // 3. chart setup
        let set = PieChartDataSet( values: entries, label: "Pie Chart")
        // this is custom extension method. Download the code for more details.
        var colors: [UIColor] = []
        
        for _ in 0 ..< self.issueArray.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        set.colors = colors
        let data = PieChartData(dataSet: set)
        pieChartView.data = data
        pieChartView.noDataText = "No data available"
        // user interaction
        pieChartView.isUserInteractionEnabled = true
        
        let d = Description()
        d.text = "iOSCharts.io"
        pieChartView.chartDescription = d
        pieChartView.centerText = ""
        pieChartView.holeRadiusPercent = 0.4
        pieChartView.transparentCircleColor = UIColor(hex: "#FFB1A0")
        pieChartView.transparentCircleRadiusPercent = 0.3
        
    }
}
