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
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
