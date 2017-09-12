//
//  LoginViewController.swift
//  Nepse
//
//  Created by Rojan on 9/5/2560 BE.
//  Copyright © 2560 Swiftech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet weak var loginbnt: UIButton!
    @IBOutlet weak var password_txt: UITextField!
    @IBOutlet weak var email_txt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.loginbnt.layer.cornerRadius = 10.0
    

        // Do any additional setup after loading the view.
    }

    let appdelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_login(_ sender: Any) {
        appdelegate?.window?.rootViewController = Wireframe.shared.getMain()
    }
    
    

}
