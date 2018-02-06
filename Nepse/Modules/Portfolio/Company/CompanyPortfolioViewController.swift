//
//  CompanyPortfolioViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/4/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class CompanyPortfolioViewController: UIViewController, IndicatorInfoProvider {

    @IBOutlet weak var tableView: UITableView!
    private let service = PortfolioService()
    fileprivate var portfolioArray = [Portfolio]()
    fileprivate var header = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.tableView.dataSource = self
        fetchData()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Company")
    }
    
    private func fetchData() {
        service.fetchPortfolio(success: { (data) in
            if let array = data.data, let headerData = data.header {
                self.portfolioArray = array
                self.header = headerData
                self.tableView.reloadData()
            }
        }) { (error) in
            self.showError(error: error.localizedDescription, completion: nil)
        }
    }

}

extension CompanyPortfolioViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return portfolioArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.getCell()
        if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor(white: 242/255.0, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor.white
        }
        cell.model = self.portfolioArray[indexPath.row]
        cell.setup()
        return cell
    }
    
    private func getCell() -> CompanyPortfolioCell {
        return self.tableView.dequeueReusableCell(withIdentifier: "CompanyPortfolioCell") as! CompanyPortfolioCell
    }
}
