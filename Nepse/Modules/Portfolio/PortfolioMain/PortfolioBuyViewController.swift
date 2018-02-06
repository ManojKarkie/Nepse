//
//  PortfolioBuyViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/6/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import DropDown
import XLPagerTabStrip

class PortfolioBuyViewController: UIViewController , IndicatorInfoProvider{

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var buyRateField: UITextField!
    @IBOutlet weak var buyUnitsField: UITextField!
    @IBOutlet weak var stockTypeField: UITextField!
    @IBOutlet weak var stockSymbolField: UITextField!
    @IBOutlet weak var anchorView: UIView!
    
    private var companyList = [Company]()
    private var dropDownList = [String]()
    private lazy var dropdown = DropDown()
    private lazy var stockTypeDropDown = DropDown()
    private var selectedCompany = Company()
    fileprivate var stockType = ["IPO", "FPO", "AUCTION", "RIGHT"]
    fileprivate var currentField = UITextField()
    private var service = IssueTypeService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDropDown()
        self.fetchCompanies()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Buy")
    }

    private func setupDropDown() {
        addBtn.slightlyCurved()
        self.dropdown.dismissMode = .automatic
        dropdown.anchorView = self.anchorView
        dropdown.direction = .top
        dropdown.width = self.stockSymbolField.frame.width + 50
        dropdown.heightAnchor.constraint(lessThanOrEqualToConstant: 200)
        dropdown.selectionAction = { (index,item) in
            self.currentField == self.stockSymbolField ? self.dropDownSelection(item, textfield: self.stockSymbolField) : self.dropDownSelection(item, textfield: self.stockTypeField)
        }
        setupFields()
    }
    
    private func setupFields() {
        stockTypeField.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldBeginEditing(_:)), for: .editingDidBegin)
        stockSymbolField.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)), for: UIControlEvents.editingChanged)
        stockSymbolField.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldBeginEditing(_:)), for: UIControlEvents.editingChanged)
    }
    
    private func dropDownSelection(_ item: String, textfield: UITextField) {
        switch textfield {
        case stockSymbolField:
            if let company = self.companyList.filter({$0.name == item}).first {
                self.selectedCompany = company
                self.stockSymbolField.text = company.symbol
            }
            break
        case stockTypeField:
            self.stockTypeField.text = item
            break
        default:
            break
        }
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
            self.currentField = self.stockSymbolField
        }
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        let model = BuySellPortfolio()
        model.cstmCode = UserModel.shared.code
        model.issuType = stockTypeField.text
        model.prflCode = stockSymbolField.text
        model.units = buyUnitsField.text
        model.rate = buyRateField.text
        service.buyPortfolio(model: model, success: { (response) in
            self.showSuccess(message: response)
        }) { (error) in
            self.showError(error: error.localizedDescription, completion: nil)
        }
    }

}

extension PortfolioBuyViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case stockSymbolField:
            if textField.text == "" {
                dropdown.hide()
            }else{
                let predicate = NSPredicate(format: "SELF CONTAINS [c] %@", textField.text!)
                let filteredArray = (self.dropDownList as NSArray).filtered(using: predicate)
                self.dropdown.dataSource = filteredArray as! [String]
                dropdown.show()
            }
            break
        default:
            break
        }
        
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case stockTypeField:
            self.dropdown.dataSource = self.stockType
            self.currentField = self.stockTypeField
            dropdown.show()
            break
        case stockSymbolField:
            self.currentField = self.stockSymbolField
            self.dropdown.dataSource = self.dropDownList
            break
        default:
            break
        }
        return true
    }
}

