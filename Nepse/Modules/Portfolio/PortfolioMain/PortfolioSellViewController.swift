//
//  PortfolioSellViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/6/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import DropDown

class PortfolioSellViewController: UIViewController , IndicatorInfoProvider{

    @IBOutlet weak var sellRateField: UITextField!
    @IBOutlet weak var stockSymbolField: UITextField!
    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var stockVolumeField: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    
    private var companyList = [Company]()
    private var dropDownList = [String]()
    private lazy var dropdown = DropDown()
    private var selectedCompany = Company()
    private var service = IssueTypeService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCompanies()
        setupDropDown()
        setupField()
    }

    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Sell")
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
    
    private func setupDropDown() {
        addBtn.slightlyCurved()
        self.dropdown.dismissMode = .automatic
        dropdown.anchorView = self.anchorView
        dropdown.direction = .top
        dropdown.width = self.stockSymbolField.frame.width + 50
        dropdown.selectionAction = { (index,item) in
           self.selectedCompany = self.companyList[index]
            self.stockSymbolField.text = self.selectedCompany.symbol
        }
    }
    
    private func setupField() {
        stockSymbolField.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)), for: UIControlEvents.editingChanged)
    }
    
    @IBAction func addAction(_ sender: Any) {
        let model = BuySellPortfolio()
        model.prflCode = stockSymbolField.text
        model.rate = sellRateField.text
        model.units = stockVolumeField.text
        service.sellPortfolio(model: model, success: { (success) in
            self.showSuccess(message: success)
        }) { (error) in
            self.showError(error: error.localizedDescription, completion: nil)
        }
    }
}

extension PortfolioSellViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            if textField.text == "" {
                dropdown.hide()
            }else{
                let predicate = NSPredicate(format: "SELF CONTAINS [c] %@", textField.text!)
                let filteredArray = (self.dropDownList as NSArray).filtered(using: predicate)
                self.dropdown.dataSource = filteredArray as! [String]
                dropdown.show()
            }
        return true
    }
}
