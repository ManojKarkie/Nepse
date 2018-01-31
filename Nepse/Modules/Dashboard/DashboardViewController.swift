//
//  DashboardViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/5/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit
import LGSideMenuController


class DashboardViewController: UIViewController {

    struct Constants {
        let tableViewActualHeight: CGFloat = 470.0
        let tableViewHeaderHeight: CGFloat = 70.0
    }

    @IBOutlet weak var containerView: UIView!
    @IBOutlet var lossHeader: UIView!
    @IBOutlet var gainHeader: UIView!
    @IBOutlet weak var lossTableView: UITableView!
    @IBOutlet weak var gainTableView: UITableView!
    @IBOutlet weak var turnOverTableView: UITableView!
    @IBOutlet weak var shareTradeTableView: UITableView!
    @IBOutlet weak var turnOverHeight: NSLayoutConstraint!
    @IBOutlet weak var shareTradeHeight: NSLayoutConstraint!
    @IBOutlet var header: UIView!
    @IBOutlet weak var byGainHeight: NSLayoutConstraint!
    @IBOutlet var header2: UIView!
    @IBOutlet weak var lossHeight: NSLayoutConstraint!
    
    private let service = DashboardService()
    fileprivate var data = Dashboard()
    fileprivate var shareTradedData = [[String]]()
    fileprivate var turnOverData = [[String]]()
    fileprivate var gainData = [[String]]()
    fileprivate var lossData = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchData()

    }
    
    private func setup() {
        self.title = "Dashboard"
        let tableViews = [shareTradeTableView, turnOverTableView, gainTableView, lossTableView]
        tableViews.forEach({ (table) in
            self.setDataSource(tableView: table ?? UITableView())
        })
        if status != .notLogged {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ios7-keypad"), style: .plain, target: self, action: #selector(self.showSideMenu))
            sideMenuController?.swipeGestureArea = .full
        }
    }
    
    private func fetchData() {
        service.fetchDashboard { (model) in
            self.data = model
            self.setupTableView()
        }
    }
    
    private func setupTableView() {
        if let shareData = data.top10ByShareVolume, shareData.count != 0 {
            self.shareTradedData = Array(shareData.prefix(10))
            self.shareTradeHeight.constant = Constants.init().tableViewActualHeight
            self.shareTradeTableView.reloadData()
        }else{
            self.shareTradeHeight.constant = Constants.init().tableViewHeaderHeight
            self.shareTradeTableView.reloadData()
        }
        if let turnOverData = data.top10ByTurnOver , turnOverData.count != 0{
            self.turnOverData = Array(turnOverData.prefix(10))
            self.turnOverHeight.constant = Constants.init().tableViewActualHeight
            self.turnOverTableView.reloadData()
        }else{
            self.turnOverHeight.constant = Constants.init().tableViewHeaderHeight
            self.turnOverTableView.reloadData()
        }
        if let gainData = data.top10ByGain , gainData.count != 0 {
            self.gainData = Array(gainData.prefix(10))
            self.byGainHeight.constant = Constants.init().tableViewActualHeight
            self.gainTableView.reloadData()
        }else{
            self.byGainHeight.constant = Constants.init().tableViewHeaderHeight
            self.gainTableView.reloadData()
        }
        if let lossData = data.top10ByLoss , lossData.count != 0{
            self.lossData = Array(lossData.prefix(10))
            self.lossHeight.constant = Constants.init().tableViewActualHeight
            self.lossTableView.reloadData()
        }else{
            self.lossHeight.constant = Constants.init().tableViewHeaderHeight
            self.lossTableView.reloadData()
        }
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        self.alertWithOkCancel(message: "Do you wish to logout?", title: "Log Out", okTitle: "Cancel", cancelTitle: "Ok", cancelStyle: .destructive, okAction: nil) {
            Auth.shared.logout()
        }
    }
    
    private func setDataSource(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension DashboardViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case shareTradeTableView:
            return shareTradedData.count
        case turnOverTableView:
            return turnOverData.count
        case gainTableView:
            return gainData.count
        case lossTableView:
            return lossData.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case shareTradeTableView:
            let cell = getShareCell()
            cell.data = self.shareTradedData[indexPath.row]
            cell.setup()
            return cell
        case turnOverTableView:
            let cell = getTurnOverCell()
            cell.data = self.turnOverData[indexPath.row]
            cell.setup()
            return cell
        case gainTableView:
            let cell = getGainCell()
            cell.data = self.gainData[indexPath.row]
            cell.setup()
            return cell
        case lossTableView:
            let cell = getLossCell()
            cell.data = self.lossData[indexPath.row]
            cell.setup()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch tableView {
        case shareTradeTableView:
            return header
            
        case turnOverTableView:
            return header2
            
        case gainTableView:
            return gainHeader
            
        case lossTableView:
            return lossHeader
            
        default:
            return UIView()
            
        }
    }
    
    func getShareCell() -> ShareTradedCell {
        return self.shareTradeTableView.dequeueReusableCell(withIdentifier: "ShareTradedCell") as! ShareTradedCell
    }
    
    func getTurnOverCell() -> TurnOverCell {
        return self.turnOverTableView.dequeueReusableCell(withIdentifier: "TurnOverCell") as! TurnOverCell
    }
    
    func getGainCell() -> GainCell {
        return self.gainTableView.dequeueReusableCell(withIdentifier: "GainCell") as! GainCell
    }
    
    func getLossCell() -> LossCell {
        return self.lossTableView.dequeueReusableCell(withIdentifier: "LossCell") as! LossCell
    }
}

extension DashboardViewController: UITableViewDelegate {
    
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
