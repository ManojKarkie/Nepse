//
//  CompanyFloorsheetViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/30/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class CompanyFloorsheetViewController: UIViewController , IndicatorInfoProvider{

    @IBOutlet var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var companyCode: String?
    private let service = FloorsheetService()
    fileprivate var floorsheetData = [FloorsheetData]()
    fileprivate var url = "api/v1/f-floorsheet"
    fileprivate var floorsheet = Floorsheet()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchCompanyData()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "FLOORSHEET")
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func fetchCompanyData() {
        service.fetchFloorsheet(pageUrl: url) { (data) in
            if let floorsheetModel = data.data {
                self.floorsheet = floorsheetModel
            }
            if let dataArray = data.data?.data {
                dataArray.filter({ (model) -> Bool in
                   return model.prflCode == self.companyCode ?? ""
                }).forEach{self.floorsheetData.append($0)}
                self.tableView.reloadData()
            }
        }
    }
    
}

extension CompanyFloorsheetViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if floorsheetData.count == 0 {
            self.url = floorsheet.nextPageUrl ?? ""
            self.fetchCompanyData()
        }
        return self.floorsheetData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getCompanyFloorsheetCell()
        if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor(white: 242/255.0, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor.white
        }
        cell.model = self.floorsheetData[indexPath.row]
        if indexPath.row == (self.floorsheetData.count - 1) && self.floorsheetData.last?.rate == cell.model?.rate {
            self.url = self.floorsheet.nextPageUrl ?? ""
            self.fetchCompanyData()
        }
        cell.setup()
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    private func getCompanyFloorsheetCell() -> CompanyFloorsheetCell {
        return self.tableView.dequeueReusableCell(withIdentifier: "CompanyFloorsheetCell") as! CompanyFloorsheetCell
    }
}

extension CompanyFloorsheetViewController: UITableViewDelegate {
    
}
