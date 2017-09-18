//
//  WishlistViewController.swift
//  Nepse
//
//  Created by Rojan on 9/9/2560 BE.
//  Copyright © 2560 Swiftech. All rights reserved.
//

import UIKit

class WishlistViewController: UIViewController {

    @IBOutlet weak var AddBtn: UIButton!
    @IBOutlet weak var searchField: UITextField!
    
    var status: GlobalConstant.Status = .notLogged
    
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
        if status != .notLogged {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(sideMenuController?.showLeftViewAnimated))
        }
    }

}

extension WishlistViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WishListCell") as? WishListCell
        cell?.setUp()
        return cell!
        
    }
}

extension WishlistViewController: UITableViewDelegate {
    
}
