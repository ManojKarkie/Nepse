//
//  WishlistViewController.swift
//  Nepse
//
//  Created by Rojan on 9/9/2560 BE.
//  Copyright © 2560 Swiftech. All rights reserved.
//

import UIKit
import DropDown

class WishlistViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var AddBtn: UIButton!
    @IBOutlet weak var searchField: UITextField!
    
    private var companyList = [Company]()
    private var dropDownList = [String]()
    private lazy var dropdown = DropDown()
    private var selectedCompany = Company()
    private let service = WatchListService()
    fileprivate var filtered = [Company]()
    fileprivate var watchListArray = [WatchList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.AddBtn.layer.cornerRadius = 5.0
        setup()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        self.title = "Watch List"
        AddBtn.slightlyCurved()
        if status != .notLogged {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ios7-keypad"), style: .plain, target: self, action: #selector(self.showSideMenu))
        }
        sideMenuController?.swipeGestureArea = .borders
        self.tableView.dataSource = self
        self.tableView.delegate = self
        fetchCompanies()
        setupField()
        setupDropDown()
    }
    
    private func setupDropDown() {
        self.dropdown.dismissMode = .automatic
        dropdown.anchorView = self.anchorView
        dropdown.direction = .bottom
        dropdown.width = self.searchField.frame.width
        dropdown.heightAnchor.constraint(lessThanOrEqualToConstant: 200)
        dropdown.selectionAction = { (index,item) in
            self.selectedCompany = self.filtered[index]
            self.searchField.text = self.selectedCompany.name
        }
    }
    
    private func setupField() {
        searchField.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)), for: UIControlEvents.editingChanged)
    }
    
    private func fetchData() {
        service.fetchWatchList(UserModel.shared.code ?? "") { (data) in
            if let array = data.data {
                self.watchListArray = array
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func addAction(_ sender: Any) {
        service.addWatchList(UserModel.shared.code ?? "", prflCode: selectedCompany.symbol ?? "", success: { (success) in
            self.showSuccess(message: success)
            self.fetchData()
        }) { (error) in
            self.showError(error: error.localizedDescription, completion: nil)
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
            self.fetchData()
            self.dropdown.dataSource = self.dropDownList
        }
    }
    
    fileprivate func getCompanyName(prflCode: String) -> String {
        return self.companyList.filter({ (model) -> Bool in
            return model.symbol == prflCode
        }).first?.name ?? ""
    }

}

extension WishlistViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.watchListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WishListCell") as! WishListCell
        cell.model = watchListArray[indexPath.row]
        cell.bankName = getCompanyName(prflCode: watchListArray[indexPath.row].prflCode ?? "")
        cell.setUp()
        return cell
    }
}

extension WishlistViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let cell = tableView.cellForRow(at: indexPath) as! WishListCell
            service.deleteWatchList(cell.model?.prflCode ?? "", success: { (success) in
                self.showSuccess(message: success)
                self.fetchData()
            }, failure: { (error) in
                self.showError(error: error.localizedDescription, completion: nil)
            })
        }
    }
}

extension WishlistViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            dropdown.hide()
        }else{
            let predicate = NSPredicate(format: "SELF CONTAINS [c] %@", textField.text!)
            let filteredArray = (self.dropDownList as NSArray).filtered(using: predicate) as! [String]
            self.dropdown.dataSource = filteredArray
            self.filtered = self.companyList.filter({ (model) -> Bool in
                return filteredArray.contains(model.name ?? "")
            })
            dropdown.show()
        }
        return true
    }
}
