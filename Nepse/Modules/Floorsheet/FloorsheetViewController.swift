//
//  FloorsheetViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 9/8/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit

class FloorsheetViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet var header: UIView!
    @IBOutlet weak var searchSymbolTextField: UITextField!
    @IBOutlet weak var searchSellerTextField: UITextField!
    @IBOutlet weak var searchBuyerTextfield: UITextField!
    let service = FloorsheetService()
    var floorsheet = Floorsheet()
    var data = [FloorsheetData]()
    var originaldata = [FloorsheetData]()
    var headers = [String]()
    var url = "api/v1/f-floorsheet"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        setup()
        fetchData() 
    }
    
    func setup(){
        self.title = "Flowsheet"
        if status != .notLogged {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ios7-keypad"), style: .plain, target: self, action: #selector(self.showSideMenu))
        sideMenuController?.swipeGestureArea = .full
        }
        self.searchBuyerTextfield.delegate = self
        self.searchSellerTextField.delegate = self
        self.searchSymbolTextField.delegate = self
        searchBuyerTextfield.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)), for: UIControlEvents.editingChanged)
        searchSellerTextField.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)), for: UIControlEvents.editingChanged)
        searchSymbolTextField.addTarget(self, action: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)), for: UIControlEvents.editingChanged)
    }

    func fetchData(){
        service.fetchFloorsheet(pageUrl: url) { (model) in
            if let floorsheetData = model.data {
                self.floorsheet = floorsheetData
            }
            if let modelArray = model.data?.data {
                modelArray.forEach{self.data.append($0)}
                modelArray.forEach{self.originaldata.append($0)}
            }
            self.headers = model.header ?? []
            self.tableview.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension FloorsheetViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FloorsheetCell") as! FloorsheetCell
        if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor(white: 242/255.0, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor.white
        }
        cell.data = self.data[indexPath.row]
        cell.setup()
        if indexPath.row == (self.data.count - 1) && self.floorsheet.nextPageUrl != "" && cell.data?.rate == self.originaldata.last?.rate
        {
            self.url = floorsheet.nextPageUrl ?? ""
            self.fetchData()
        }
        cell.getSymbolName = { name in
            let vc = Wireframe.shared.getCompanyProfile()
            vc.companyCode = name
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.header.frame.size.width = self.view.frame.width
        return header
    }
}

extension FloorsheetViewController : UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case searchBuyerTextfield:
            search(textfield: textField, string: "buyer")
        case searchSellerTextField:
            search(textfield: textField, string: "seller")
        case searchSymbolTextField:
            search(textfield: textField, string: "prflCode")
        default:
            break
        }
        
        return true
    }
    
    private func search(textfield: UITextField, string: String) {
        if (textfield.text ?? "").characters.count > 0 {
            let predicate = NSPredicate(format: "\(string) CONTAINS [c] %@", textfield.text!)
            self.data = self.originaldata
            if let filteredArray = (self.data as NSArray).filtered(using: predicate) as? [FloorsheetData] {
                self.data = filteredArray
                self.tableview.reloadData()
            }
        }else {
            self.url = "api/v1/f-floorsheet"
            self.data = []
            self.originaldata = []
            fetchData()
        }
    }
}

extension FloorsheetViewController: UITableViewDelegate {
    
}

