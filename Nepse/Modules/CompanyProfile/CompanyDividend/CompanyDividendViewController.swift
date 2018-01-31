//
//  CompanyDividendViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/30/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class CompanyDividendViewController: UIViewController , IndicatorInfoProvider{

    @IBOutlet var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "DIVIDEND")
    }
}

extension CompanyDividendViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getDividendCell()
        if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor(white: 242/255.0, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor.white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    private func getDividendCell() -> CompanyDividendCell {
        return self.tableView.dequeueReusableCell(withIdentifier: "CompanyDividendCell") as! CompanyDividendCell
    }
}

extension CompanyDividendViewController: UITableViewDelegate {
    
}
