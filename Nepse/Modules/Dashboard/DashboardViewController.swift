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

    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var bottomStack: UIStackView!
    @IBOutlet weak var collapseHeader: UIImageView!
    @IBOutlet var header: UIView!
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chartViewContainer: UIView!
    @IBOutlet var header2: UIView!
    
    let service = DashboardService()
    var data = [Dashboard]()
    var transactionData = [Transactions]()
    
    var expanding = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tableView.delegate = self
        tableView.dataSource = self
        tableView2.delegate = self
        tableView2.dataSource = self
        fetchData()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(collapseTableView))
        collapseHeader.addGestureRecognizer(tapGesture)
        collapseHeader.isUserInteractionEnabled = true
    }
    
    @objc func collapseTableView() {
//        bottomStack.isHidden = expanding
//        expanding = !expanding
//
//        tableView.reloadSections(IndexSet.init(arrayLiteral: 0,0), with: .automatic)
    }
    
    
    func setup() {
        bottomStack.isHidden = !expanding
        self.title = "Dashboard"
        if status != .notLogged {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ios7-keypad"), style: .plain, target: self, action: #selector(self.showSideMenu))
        }
        sideMenuController?.swipeGestureArea = .full
        sideMenuController?.leftViewBackgroundBlurEffect = UIBlurEffect(style: .regular)
        chartViewContainer.layer.cornerRadius = 5
        chartViewContainer.layer.borderColor = UIColor.lightGray.cgColor
        chartViewContainer.layer.borderWidth = 0.5
        self.tableView.setStandardShadow()
        self.tableView2.setStandardShadow()
        self.navigationController?.navigationBar.isTranslucent = false
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
        
        service.fetchNumberOfShareTransaction { (data) in
            self.transactionData = data
            self.tableView2.reloadData()
        }
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
        chartView.drawGridBackgroundEnabled = false
        
        chartDataSet.valueTextColor = NSUIColor.white
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        switch tableView.tag {
        case 1:
            count = self.data.count
            break
        case 2:
            count = self.transactionData.count
            break
        default:
            break
        }
        return expanding ? count ?? 0 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView.tag {
        case 1:
            let cell1 = getDashBoardCell()
            if indexPath.row % 2 == 0{
                cell1.contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1)
            }
            cell1.data = self.data[indexPath.row]
            cell1.setup()
            return cell1
        case 2:
            let cell2 = getTurnOverCell()
            if indexPath.row % 2 == 0{
                cell2.contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1)
            }
            cell2.transaction = self.transactionData[indexPath.row]
            cell2.setup()
            return cell2
        default:
            return UITableViewCell()
        }
    }
    
    func getDashBoardCell() -> DashboardCell {
        return self.tableView.dequeueReusableCell(withIdentifier: "DashboardCell") as! DashboardCell
    }
    
    func getTurnOverCell() -> TrunOverCell {
        return self.tableView2.dequeueReusableCell(withIdentifier: "TrunOverCell") as! TrunOverCell
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
        
        return expanding ? height! : 25
        }
}

class RoundCornerButton: UIButton {
    
    open override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.size.height/8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}

extension UITableView {
    
    func setStandardShadow() {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.8
    }
}
