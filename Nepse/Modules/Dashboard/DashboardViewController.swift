//
//  DashboardViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/5/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit
import LGSideMenuController
import Charts

class DashboardViewController: UIViewController {

    @IBOutlet weak var bottomStack: UIStackView!
    @IBOutlet weak var collapseHeader: UIImageView!
    @IBOutlet var header: UIView!
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chartViewContainer: UIView!
    
    let service = DashboardService()
    var data = [Dashboard]()
    
    var expanding = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tableView.delegate = self
        tableView.dataSource = self
        fetchData()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(collapseTableView))
        collapseHeader.addGestureRecognizer(tapGesture)
        collapseHeader.isUserInteractionEnabled = true
    }
    
    func collapseTableView() {
        bottomStack.isHidden = expanding
        expanding = !expanding
        tableView.reloadData()
    }
    
    var status: GlobalConstant.Status = .notLogged
    
    
    func setup() {
        bottomStack.isHidden = !expanding
        self.title = "Dashboard"
        if status != .notLogged {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ios7-keypad"), style: .plain, target: self, action: #selector(sideMenuController?.showLeftViewAnimated))
        }
        sideMenuController?.swipeGestureArea = .full
        sideMenuController?.leftViewBackgroundBlurEffect = UIBlurEffect(style: .regular)
        chartViewContainer.layer.cornerRadius = 5
        chartViewContainer.layer.borderColor = UIColor.lightGray.cgColor
        chartViewContainer.layer.borderWidth = 0.5
        self.tableView.layer.borderColor = UIColor.lightGray.cgColor
        self.tableView.layer.borderWidth = 0.5
        self.tableView.layer.cornerRadius = 5
        self.tableView.layer.shadowColor = UIColor.lightGray.cgColor
        self.tableView.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.tableView.layer.shadowRadius = 3
        self.tableView.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func fetchData() {
        service.fetchDashboard(completion: { 
            (data) in
            self.data = data
            self.tableView.reloadData()
            self.drawChart()
        })
    }
    
    func drawChart() {
        var chartEntries: [ChartDataEntry] = []
        for i:Int in 0 ..< data.count {
            let string = data[i].cost!.replacingOccurrences(of: ",", with: "")
            let chartData = ChartDataEntry(x: Double(i), y: Double(string )!)
            chartEntries.append(chartData)
        }
        let chartDataSet = LineChartDataSet(values: chartEntries, label: "Values")
        chartDataSet.drawFilledEnabled = true
        chartDataSet.cubicIntensity = 5
        chartDataSet.drawCirclesEnabled = false
        chartDataSet.mode = .horizontalBezier
        let chartData = LineChartData(dataSet: chartDataSet)
        chartView.data = chartData
    }
}

extension DashboardViewController: UITableViewDelegate {
    
}

extension DashboardViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expanding ? self.data.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardCell") as? DashboardCell
        if indexPath.row % 2 == 0{
            cell?.contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1)
        }
        cell?.data = self.data[indexPath.row]
        cell?.setup()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return expanding ? 50 : 25
        }
}

class RoundCornerButton: UIButton {
    
    open override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.size.height/8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
