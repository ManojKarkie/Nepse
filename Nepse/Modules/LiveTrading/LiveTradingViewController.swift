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

    
    @IBOutlet weak var searchBuyerTextfield: UITextField!

    var tradingData = [LiveTradingData]()
    var originalData = [LiveTradingData]()
    var headers = [String]()
    let service = LiveTradingService()
    fileprivate var watchListArray = [WatchList]()
    
    enum Diff {
        case percent
        case value
    }
    
    enum CurrentData {
        case liveTrading
        case watchList
    }
    
    var currentData: CurrentData = .liveTrading
    var currentDff: Diff = .percent
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
        fetchWatchList()
    }
    
    func setup(){
        self.title = "Live Trading"
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.isDirectionalLockEnabled = true
        tradingSwitch.onTintColor = UIColor(hex: "#2D6687")
        tradingSwitch.thumbTintColor = UIColor.white
        if status != .notLogged {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ios7-keypad"), style: .plain, target: self, action: #selector(self.showSideMenu))
            sideMenuController?.swipeGestureArea = .full
        }
        searchBuyerTextfield.delegate = self
        searchBuyerTextfield.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)), for: UIControlEvents.editingChanged)
        self.tradingSwitch.addTarget(self, action: #selector(switchTable(_:)), for: .valueChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func fetchData() {
        service.fetchLiveTrading(completion: {
            (data) in
            if let array = data.data {
                self.tradingData = array
                self.originalData = array
            }
            if let headers = data.header {
                self.headers = headers
            }
            self.collectionView.reloadData()
        })
    }
    
    @objc private func switchTable(_ sender: UISwitch) {
    if sender.isOn {
        currentData = .watchList
        self.collectionView.reloadData()
    }else {
        currentData = .liveTrading
        self.collectionView.reloadData()
    }
    }
    
    private func fetchWatchList() {
        WatchListService().fetchWatchList(UserModel.shared.code ?? "") { (data) in
            if let array = data.data {
                self.watchListArray = array
            }
        }
    }

}



extension LiveTradingViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch currentData {
        case .liveTrading:
            return self.tradingData.count
        case .watchList:
            return self.watchListArray.count
        }
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
            if (Float(self.tradingData[indexPath.section].diffP ) ?? 0) < 0.0 && indexPath.row == 7 && indexPath.section != 0{
                cell.contentLabel.textColor = UIColor.red
            }else if (Float(self.tradingData[indexPath.section].diffP ) ?? 0) >= 0.0 && indexPath.row == 7 && indexPath.section != 0{
                cell.contentLabel.textColor = UIColor.green
            }else{
                cell.contentLabel.textColor = UIColor.gray
            }
        case .value:
            if (Float(self.tradingData[indexPath.section].diffVal ) ?? 0) < 0.0 && indexPath.row == 7 && indexPath.section != 0{
                cell.contentLabel.textColor = UIColor.red
            }else if (Float(self.tradingData[indexPath.section].diffVal ) ?? 0) >= 0.0 && indexPath.row == 7 && indexPath.section != 0{
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
            
            switch currentData {
            case .liveTrading:
                switch indexPath.row {
                case 0:
                    cell.contentLabel.underline(text: self.tradingData[indexPath.section].prflCode )
                case 1:
                    cell.contentLabel.text = self.tradingData[indexPath.section].close
                case 2:
                    cell.contentLabel.text = self.tradingData[indexPath.section].open
                case 3:
                    cell.contentLabel.text = self.tradingData[indexPath.section].high
                case 4:
                    cell.contentLabel.text = self.tradingData[indexPath.section].low
                case 5:
                    cell.contentLabel.text = "\(self.tradingData[indexPath.section].volume )"
                case 6:
                    cell.contentLabel.text = self.tradingData[indexPath.section].turnover
                case 7:
                    cell.contentLabel.text = currentDff == .percent ? self.tradingData[indexPath.section].diffP : self.tradingData[indexPath.section].diffVal
                    
                default:
                    break
                }
            case .watchList:
                switch indexPath.row {
                case 0:
                    cell.contentLabel.underline(text: self.watchListArray[indexPath.section].prflCode ?? "" )
                case 1:
                    cell.contentLabel.text = self.watchListArray[indexPath.section].liveTrading?.close
                case 2:
                    cell.contentLabel.text = self.watchListArray[indexPath.section].liveTrading?.open
                case 3:
                    cell.contentLabel.text = self.watchListArray[indexPath.section].liveTrading?.high
                case 4:
                    cell.contentLabel.text = self.watchListArray[indexPath.section].liveTrading?.low
                case 5:
                    cell.contentLabel.text = "\(self.watchListArray[indexPath.section].liveTrading?.volume ?? 0 )"
                case 6:
                    cell.contentLabel.text = self.watchListArray[indexPath.section].liveTrading?.turnover
                case 7:
                    cell.contentLabel.text = currentDff == .percent ? self.watchListArray[indexPath.section].liveTrading?.diffP : self.watchListArray[indexPath.section].liveTrading?.diffVal
                    
                default:
                    break
                }
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

extension LiveTradingViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (textField.text ?? "").characters.count > 0 {
            let predicate = NSPredicate(format: "prflCode CONTAINS [c] %@", textField.text!)
            self.tradingData = self.originalData
            if let filteredArray = (self.tradingData as NSArray).filtered(using: predicate) as? [LiveTradingData] {
                self.tradingData = filteredArray
                self.collectionView.reloadData()
            }
        }else {
            self.tradingData = []
            self.originalData = []
            fetchData()
        }
        return true
    }
}

