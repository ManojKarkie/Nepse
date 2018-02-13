//
//  AlertsViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/7/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import DropDown

class AlertsViewController: UIViewController, IndicatorInfoProvider {

    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var alertField: UITextField!
    
    private var companyList = [Company]()
    private var dropDownList = [String]()
    private var alertDropDownList = [String]()
    private lazy var dropdown = DropDown()
    private lazy var alertDropdown = DropDown()
    private var selectedAlert = AlertCode()
    private var selectedCompany = Company()
    fileprivate var filtered = [Company]()
    private let service = AlertService()
    private var alertCodeList = [AlertCode]()
    fileprivate var alertList = [Alert]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCompanies()
        fetchAlertCode()
        setup()
        setupDropDown()
        setupField()
    }
    
    private func fetchCompanies() {
        DashboardService().fetchIndexList { (list) in
            if let companies = list.companies {
                self.companyList = companies
            }
            if let dropList = list.companies {
                self.dropDownList = dropList.map{$0.name ?? ""}
            }
            self.dropdown.dataSource = self.dropDownList
        }
    }
    
    private func fetchAlertCode() {
        service.fetchAlertCode { (data) in
            if let array = data.data {
                self.alertCodeList = array
                self.alertDropDownList = array.map{$0.descr ?? ""}
            }
            self.fetchAlerts()
            self.alertDropdown.dataSource = self.alertDropDownList
        }
    }
    
    private func fetchAlerts() {
        service.fetchAlerts { (data) in
            if let array = data.data {
                self.alertList = array
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupDropDown() {
        addBtn.slightlyCurved()
        self.dropdown.dismissMode = .automatic
        dropdown.anchorView = self.anchorView
        dropdown.direction = .bottom
        dropdown.width = self.view.frame.width - 100
        dropdown.selectionAction = { (index,item) in
            self.selectedCompany = self.filtered[index]
            self.searchField.text = self.selectedCompany.symbol
        }
        self.alertDropdown.dismissMode = .automatic
        self.alertDropdown.anchorView = self.anchorView
        self.alertDropdown.direction = .bottom
        self.alertDropdown.width = self.view.frame.width - 100
        self.alertDropdown.selectionAction = {(index, item) in
            self.alertField.text = item
            self.selectedAlert = self.alertCodeList[index]
        }
    }
    
    private func setupField() {
        searchField.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)), for: UIControlEvents.editingChanged)
        alertField.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldBeginEditing(_:)), for: UIControlEvents.editingDidBegin)
    }
    
    private func setup() {
        self.addBtn.slightlyCurved()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        sideMenuController?.swipeGestureArea = .borders
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Add Alerts")
    }
    
    @IBAction func addAction(_ sender: Any) {
        service.addAlert(UserModel.shared.code ?? "", self.selectedCompany.symbol ?? "", "\(self.selectedAlert.code ?? 0)", success: { (success) in
            self.showSuccess(message: success)
            self.fetchAlerts()
        }) { (error) in
            self.showError(error: error.localizedDescription, completion: nil)
        }
    }
    
    fileprivate func getAlert(alert: Alert) -> AlertCode {
        if let alertC = self.alertCodeList.filter({ (code) -> Bool in
            return code.code == Int(alert.alrtCode ?? "")
        }).first{
            return alertC
        }else{
            return AlertCode()
        }
    }
}

extension AlertsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alertList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getCell()
        cell.data = (getAlert(alert: alertList[indexPath.row]).descr ?? "") + " Of " + (alertList[indexPath.row].prflCode ?? "")
        cell.alert = alertList[indexPath.row]
        cell.setup()
        return cell
    }
    
    private func getCell() -> AlertsCell {
        return self.tableView.dequeueReusableCell(withIdentifier: "AlertsCell") as! AlertsCell
    }
}

extension AlertsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let cell = tableView.cellForRow(at: indexPath) as! AlertsCell
            if let data = cell.alert {
                service.deleteAlerts(UserModel.shared.code ?? "", data.prflCode ?? "", data.alrtCode ?? "", success: { (response) in
                    
                }, failure: { (error) in
                    
                })
            }
        }
    }
}

extension AlertsViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            dropdown.hide()
        }else{
            let predicate = NSPredicate(format: "SELF CONTAINS [c] %@", textField.text!)
            let filteredArray = (self.dropDownList as NSArray).filtered(using: predicate) as! [String]
            self.filtered = self.companyList.filter({ (model) -> Bool in
                return filteredArray.contains(where: {model.name ?? "" == $0})
            })
            self.dropdown.dataSource = filteredArray
            dropdown.show()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.alertDropdown.show()
        return true
    }
}

