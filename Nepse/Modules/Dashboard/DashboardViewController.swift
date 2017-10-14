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
    
    func collapseTableView() {
//        bottomStack.isHidden = expanding
//        expanding = !expanding
//
//        tableView.reloadSections(IndexSet.init(arrayLiteral: 0,0), with: .automatic)
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
        self.tableView2.layer.borderColor = UIColor.lightGray.cgColor
        self.tableView2.layer.borderWidth = 0.5
        self.tableView2.layer.cornerRadius = 5
        self.tableView2.layer.shadowColor = UIColor.lightGray.cgColor
        self.tableView2.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.tableView2.layer.shadowRadius = 3
        self.tableView2.layer.shadowOpacity = 0.8
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        switch tableView.tag {
        case 1:
            count = self.data.count
            break
        case 2:
            count = 5
            break
        default:
            break
        }
        return expanding ? count ?? 0 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        switch tableView.tag {
        case 1:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "DashboardCell") as! DashboardCell
            if indexPath.row % 2 == 0{
                cell?.contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1)
            }
            cell1.data = self.data[indexPath.row]
            cell1.setup()
            cell = cell1
            break
        case 2:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "TrunOverCell") as? TrunOverCell
            if indexPath.row % 2 == 0{
                cell?.contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1)
            }
            cell = cell2
            break
        default:
            break
        }
        return cell!
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
