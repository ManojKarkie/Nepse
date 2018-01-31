//
//  LiveTradingViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/8/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit

class LiveTradingViewController: UIViewController {

 
    @IBOutlet weak var tradingSwitch: UISwitch!

    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var searchSymbolTextField: UITextField!
    @IBOutlet weak var searchSellerTextField: UITextField!
    @IBOutlet weak var searchBuyerTextfield: UITextField!
    @IBOutlet weak var searchWiidth: NSLayoutConstraint!

    var tradingData = [LiveTradingData]()
    var headers = [String]()
    let service = LiveTradingService()
    
    enum Diff {
        case percent
        case value
    }
    
    var currentDff: Diff = .percent
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
    
    func setup(){
        self.title = "Live Trading"
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        tradingSwitch.onTintColor = UIColor.white
        tradingSwitch.thumbTintColor = UIColor(hex: "#2D6687")
        if status != .notLogged {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ios7-keypad"), style: .plain, target: self, action: #selector(self.showSideMenu))
            sideMenuController?.swipeGestureArea = .full
        }
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func fetchData() {
        service.fetchLiveTrading(completion: {
            (data) in
            if let array = data.data {
                self.tradingData = array
            }
            if let headers = data.header {
                self.headers = headers
            }
            self.collectionView.reloadData()
        })
    }

}

extension LiveTradingViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.tradingData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.headers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveTradingColCell",
                                                      for: indexPath) as! LiveTradingColCell
        
        if indexPath.section % 2 != 0 {
            cell.backgroundColor = UIColor(white: 242/255.0, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor.white
        }
       
        cell.column.isHidden = indexPath.row == 0 ? false : true
        cell.headerBar.isHidden = indexPath.section == 0 ? false : true
        switch currentDff {
        case .percent:
            if (Float(self.tradingData[indexPath.section].diffP ?? "") ?? 0) < 0.0 && indexPath.row == 7 && indexPath.section != 0{
                cell.contentLabel.textColor = UIColor.red
            }else if (Float(self.tradingData[indexPath.section].diffP ?? "") ?? 0) >= 0.0 && indexPath.row == 7 && indexPath.section != 0{
                cell.contentLabel.textColor = UIColor.green
            }else{
                cell.contentLabel.textColor = UIColor.gray
            }
        case .value:
            if (Float(self.tradingData[indexPath.section].diffVal ?? "") ?? 0) < 0.0 && indexPath.row == 7 && indexPath.section != 0{
                cell.contentLabel.textColor = UIColor.red
            }else if (Float(self.tradingData[indexPath.section].diffVal ?? "") ?? 0) >= 0.0 && indexPath.row == 7 && indexPath.section != 0{
                cell.contentLabel.textColor = UIColor.green
            }else{
                cell.contentLabel.textColor = UIColor.gray
            }
        }
        
        if indexPath.section == 0 {
            cell.contentLabel.font = UIFont.boldSystemFont(ofSize: 17)
            switch indexPath.row {
            case 0:
                cell.contentLabel.text = headers[indexPath.row]
            case 1:
            
                cell.contentLabel.text = headers[indexPath.row]
            case 2:
                cell.contentLabel.text = headers[indexPath.row]
            case 3:
                cell.contentLabel.text = headers[indexPath.row]
            case 4:
                cell.contentLabel.text = headers[indexPath.row]
            case 5:
                cell.contentLabel.text = headers[indexPath.row]
            case 6:
                cell.contentLabel.text = headers[indexPath.row]
            case 7:
                cell.contentLabel.text = headers[indexPath.row]
            default:
                break
            }
        } else {
            cell.contentLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
            
            switch indexPath.row {
            case 0:
                cell.contentLabel.underline(text: self.tradingData[indexPath.section].prflCode ?? "")
            case 1:
                cell.contentLabel.text = self.tradingData[indexPath.section].close
            case 2:
                cell.contentLabel.text = self.tradingData[indexPath.section].open
            case 3:
                cell.contentLabel.text = self.tradingData[indexPath.section].high
            case 4:
                cell.contentLabel.text = self.tradingData[indexPath.section].low
            case 5:
                cell.contentLabel.text = "\(self.tradingData[indexPath.section].volume ?? 0)"
            case 6:
                cell.contentLabel.text = self.tradingData[indexPath.section].turnover
            case 7:
                cell.contentLabel.text = currentDff == .percent ? self.tradingData[indexPath.section].diffP : self.tradingData[indexPath.section].diffVal
                
            default:
                break
            }
        }
        
        return cell
    }
}

extension LiveTradingViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! LiveTradingColCell
        if indexPath.section > 0 {
        switch indexPath.row {
        case 0:
            let companyProfile = Wireframe.shared.getCompanyProfile()
            companyProfile.companyCode = cell.contentLabel.text
            self.navigationController?.pushViewController(companyProfile, animated: true)
        case 7:
            self.currentDff = currentDff == .percent ? .value : .percent
            self.collectionView.reloadData()
        default:
            break
        }
        }
    }
}

