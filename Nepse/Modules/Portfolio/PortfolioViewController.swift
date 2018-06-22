//
//  PortfolioViewController.swift
//  Nepse
//
//  Created by Rojan on 9/20/2560 BE.
//  Copyright © 2560 Swiftech. All rights reserved.
//

import UIKit
import LGSideMenuController
import DropDown

struct NotificationName {
    let updateSales = NSNotification.Name(rawValue: "UPDATE_SELLS")
    let updateBuys = NSNotification.Name(rawValue: "UPDATE_BUYS")
}

class PortfolioViewController: UIViewController {
    @IBOutlet weak var buyBtn: UIButton!
    
    @IBOutlet weak var sellBtn: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var soldCollectionheight: NSLayoutConstraint!
    
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sellSelectedBar: UIView!
    
    @IBOutlet weak var buyView: UIView!
    @IBOutlet weak var soldCollectionView: UICollectionView!
    private let service = IssueTypeService()
    private var controller = PortfolioSellViewController()
    fileprivate var boughtShares = [BoughtShares]()
    fileprivate var soldShares = [SoldShares]()
    fileprivate var boughtShareHeader = ["BUY_DT", "ISSU_TYPE", "PRFL_CODE", "BUY_UNITS", "BUY_RATE"]
    fileprivate var soldShareHeader = ["SELL_DT", "PRFL_CODE", "SELL_UNITS", "SELL_RATE"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchBuySell()
    }

    private func setUp(){
        self.title = "Portfolio"
        self.sellSelectedBar.isHidden = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ios7-keypad"), style: .plain, target: self, action: #selector(self.showSideMenu))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(Auth.shared.logout))
        collectionView.dataSource = self
        self.soldCollectionView.dataSource = self
        self.soldCollectionView.isHidden = true
        self.bottomView.center.x = self.buyBtn.center.x
        NotificationCenter.default.addObserver(self, selector: #selector(buyUpdated), name: NotificationName().updateBuys, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sellUpdated), name: NotificationName().updateSales, object: nil)
    }
    
    @objc private func buyUpdated() {
        viewBoughtShares(self)
        fetchBuySell()
        
    }
    
    @objc private func sellUpdated() {
        viewSoldShares(self)
        fetchBuySell()
    }
    
    private func fetchBuySell() {
        service.fetchBoughtSoldShares(success: { (sharesData) in
            if let boughtData = sharesData.boughtShares {
                self.boughtShares =  boughtData
            }
            if let soldData = sharesData.soldShares {
                self.soldShares = soldData
            }
            self.collectionHeight.constant = CGFloat(30 + (self.boughtShares.count * 30))
            self.collectionView.reloadData()
        }) { (error) in
            self.showError(error: error.localizedDescription, completion: nil)
        }
    }
    
    @IBAction func viewBoughtShares(_ sender: Any) {
        self.bottomView.isHidden = false
        self.sellSelectedBar.isHidden = true
        self.soldCollectionView?.isHidden = true
        self.collectionView.isHidden = false
        self.collectionView.reloadData()
    }
    @IBAction func viewSoldShares(_ sender: Any) {
        self.sellSelectedBar.isHidden = false
        self.bottomView.isHidden = true
        self.soldCollectionView?.isHidden = false
        self.collectionView.isHidden = true
        self.soldCollectionheight.constant = CGFloat(30 + (self.soldShares.count) * 30)
        self.soldCollectionView?.reloadData()
    }
}

extension PortfolioViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch collectionView {
        case self.collectionView:
            return boughtShares.count + 1
        case self.soldCollectionView!:
            return soldShares.count + 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.collectionView:
            return boughtShareHeader.count
        case self.soldCollectionView:
            return soldShareHeader.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView {
        case self.collectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PortfolioBuySellCell",
                                                          for: indexPath) as! PortfolioBuySellCell
            
//            if indexPath.section % 2 != 0 {
//                cell.backgroundColor = UIColor(white: 242/255.0, alpha: 1.0)
//            } else {
                cell.backgroundColor = UIColor.white
//            }
            
            cell.column.isHidden = indexPath.row == 0 ? false : true
            cell.headerBar.isHidden = indexPath.section == 0 ? false : true
            if indexPath.section == 0 {
                cell.contentLabel.font = UIFont.boldSystemFont(ofSize: 17)
                switch indexPath.row {
                case 0:
                    cell.contentLabel.text = boughtShareHeader[indexPath.row]
                case 1:
                    
                    cell.contentLabel.text = boughtShareHeader[indexPath.row]
                case 2:
                    cell.contentLabel.text = boughtShareHeader[indexPath.row]
                case 3:
                    cell.contentLabel.text = boughtShareHeader[indexPath.row]
                case 4:
                    cell.contentLabel.text = boughtShareHeader[indexPath.row]
                default:
                    break
                }
            } else {
                cell.contentLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
                
                switch indexPath.row {
                case 0:
                    cell.contentLabel.text = self.boughtShares[indexPath.section - 1].buyDt
                case 1:
                    cell.contentLabel.text = self.boughtShares[indexPath.section - 1].issueTypeCode
                case 2:
                    cell.contentLabel.text = self.boughtShares[indexPath.section - 1].prflCode
                case 3:
                    cell.contentLabel.text = "\(self.boughtShares[indexPath.section - 1].buyUnits ?? 0)"
                case 4:
                    cell.contentLabel.text = self.boughtShares[indexPath.section - 1].buyRate
                default:
                    break
                }
            }
            return cell
        case self.soldCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewSoldCell",
                                                          for: indexPath) as! CollectionViewSoldCell
//            if indexPath.section % 2 != 0 {
//                cell.backgroundColor = UIColor(white: 242/255.0, alpha: 1.0)
//            } else {
                cell.backgroundColor = UIColor.white
//            }
            cell.column.isHidden = indexPath.row == 0 ? false : true
            cell.headerBar.isHidden = indexPath.section == 0 ? false : true
            if indexPath.section == 0 {
                cell.contentLabel.font = UIFont.boldSystemFont(ofSize: 17)
                switch indexPath.row {
                case 0:
                    cell.contentLabel.text = soldShareHeader[indexPath.row]
                case 1:
                    
                    cell.contentLabel.text = soldShareHeader[indexPath.row]
                case 2:
                    cell.contentLabel.text = soldShareHeader[indexPath.row]
                case 3:
                    cell.contentLabel.text = soldShareHeader[indexPath.row]
                default:
                    break
                }
            } else {
                cell.contentLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
                
                switch indexPath.row {
                case 0:
                    cell.contentLabel.text = self.soldShares[indexPath.section - 1].sellDt
                case 1:
                    cell.contentLabel.text = self.soldShares[indexPath.section - 1].prflCode
                case 2:
                    cell.contentLabel.text = "\(self.soldShares[indexPath.section - 1].sellUnits ?? 0)"
                case 3:
                    cell.contentLabel.text = self.soldShares[indexPath.section - 1].sellRate
                    
                default:
                    break
                }
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension UIView {
    
    func slightlyCurved() {
        self.layer.cornerRadius = 5
    }
}
