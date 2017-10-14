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
        self.title = "Login"
        self.loginbnt.layer.cornerRadius = 10.0
    

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToRegistration(_ sender: Any) {
        self.navigationController?.pushViewController(Wireframe.shared.getRegister(), animated: true)
    }
    
    
    @IBAction func btn_login(_ sender: Any) {
        appdelegate?.window?.rootViewController = LGSideMenuWireframe().getMainView()
    }
    
    

}
