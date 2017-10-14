//
//  RegisterViewController.swift
//  Nepse
//
//  Created by Rojan on 9/5/2560 BE.
//  Copyright © 2560 Swiftech. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerbtn: UIButton!
    @IBOutlet weak var phoneno: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailaddress: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var firstname: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Register"
        self.registerbtn.layer.cornerRadius = 10.0

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

    
    @IBAction func btn_register(_ sender: Any) {
    }
}
