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
 
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet var header: UIView!
    @IBOutlet weak var searchSymbolTextField: UITextField!
    @IBOutlet weak var searchSellerTextField: UITextField!
    @IBOutlet weak var searchBuyerTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        setup()
        
    }
    
    func setup(){
        self.title = "Live Trading"
        searchBuyerTextfield.frame.size.width = (self.view.frame.size.width - 90)/3
        searchSellerTextField.frame.size.width = (self.view.frame.size.width - 90)/3
        searchSymbolTextField.frame.size.width = (self.view.frame.size.width - 90)/3
        header.frame.size.width = self.view.frame.size.width
        tradingSwitch.onTintColor = UIColor.white
        tradingSwitch.thumbTintColor = UIColor(hex: "#234E66")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(sideMenuController?.showLeftViewAnimated))
        sideMenuController?.swipeGestureArea = .full
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension LiveTradingViewController: UITableViewDelegate {
    
}

extension LiveTradingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LiveTradingCell") as? LiveTradingCell
        if indexPath.row % 2 == 0{
            cell?.contentView.backgroundColor = UIColor(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1)
        }
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return header
    }
}

