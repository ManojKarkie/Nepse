//
//  ProfileViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/1/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import DropDown

class ProfileViewController: UIViewController {

    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var searchField: UITextField!
    private var companyList = [Company]()
    private var dropDownList = [String]()
    private let dropdown = DropDown()
    private var selectedCompany = Company()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.fetchCompanies()
        self.setupDropDown()
    }
    
    private func setup() {
        searchField.delegate = self
        searchBtn.setButton()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ios7-keypad"), style: .plain, target: self, action: #selector(self.showSideMenu))
    }
    
    private func setupDropDown() {
        self.dropdown.dismissMode = .automatic
        dropdown.anchorView = self.anchorView
        dropdown.direction = .top
        dropdown.width = self.view.frame.width - 100
        dropdown.heightAnchor.constraint(lessThanOrEqualToConstant: 200)
        
        searchField.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)), for: UIControlEvents.editingChanged)
        dropdown.selectionAction = { (index,item) in
            if let company = self.companyList.filter({$0.name == item}).first {
                self.selectedCompany = company
                self.searchField.text = company.name
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       self.title = "Search Profile"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.dropdown.hide()
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
    
    @IBAction func searchCompany(_ sender: UIButton) {
        CompanyService().fetchCompanyProfile(companyCode: self.selectedCompany.symbol ?? "", success: { (model) in
            let companyProfile = Wireframe.shared.getCompanyProfile()
            companyProfile.companyCode = self.selectedCompany.symbol
            self.navigationController?.pushViewController(companyProfile, animated: true)
        }) { (error) in
            self.showError(error: error.localizedDescription, completion: nil)
        }
        
    }
}

extension ProfileViewController: UITextFieldDelegate {
    
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

