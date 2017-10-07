//
//  PortfolioViewController.swift
//  Nepse
//
//  Created by Rojan on 9/20/2560 BE.
//  Copyright © 2560 Swiftech. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController {

    @IBOutlet weak var shares: UILabel!
    @IBOutlet weak var shareAddedView: UIView!
    @IBOutlet weak var shrebgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUp(){
        shrebgView.layer.cornerRadius = 50.0
        shareAddedView.layer.cornerRadius = 50.0
  
    
        
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
