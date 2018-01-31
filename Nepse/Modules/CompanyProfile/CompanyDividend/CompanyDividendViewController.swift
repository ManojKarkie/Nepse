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

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var prflCode: String?
    private let service = CompanyDividendService()
    fileprivate var headers = [String]()
    fileprivate var data = [CompanyDividend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
    
    private func setup() {
        self.collectionView.dataSource = self
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "DIVIDEND")
    }
    
    fileprivate func fetchData() {
        if let code = prflCode {
            self.service.fetchCompanyDividend(code: code, success: { (response) in
                if let header = response.header {
                    self.headers = header
                }
                if let responseData = response.data {
                    self.data = responseData
                }
                self.collectionView.reloadData()
            }, failure: {
                
            })
        }
    }
    
}

extension CompanyDividendViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompanyDividendCell",
                                                      for: indexPath) as! CompanyDividendCell
        
        if indexPath.section % 2 != 0 {
            cell.backgroundColor = UIColor(white: 242/255.0, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        if indexPath.section == 0 {
            cell.contentLabel.font = UIFont.boldSystemFont(ofSize: 12)
            switch indexPath.row {
            case 0:
                cell.contentLabel.text = headers[indexPath.row]
            case 1:
                
                cell.contentLabel.text = headers[indexPath.row]
            case 2:
                cell.contentLabel.text = headers[indexPath.row]
            case 3:
                cell.contentLabel.text = headers[indexPath.row]
            default:
                break
            }
        } else {
            cell.contentLabel.font = UIFont.systemFont(ofSize: 11, weight: .light)
            cell.contentLabel.textColor = UIColor.gray
            switch indexPath.row {
            case 0:
                cell.contentLabel.text = self.data[indexPath.section].fiscalYear
            case 1:
                cell.contentLabel.text = self.data[indexPath.section].bonusShare
            case 2:
                cell.contentLabel.text = self.data[indexPath.section].cashDividend
            case 3:
                cell.contentLabel.text = self.data[indexPath.section].totalDividend
            default:
                break
            }
        }
        return cell
    }
}



