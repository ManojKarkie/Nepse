//
//  ActivateUserViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/19/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit

class ActivateUserViewController: UIViewController {

    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var codeField: UITextField!
    
    var number: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.title = "Activate User"
        self.numberField.text = number
    }
    
    @IBAction func activateAction(_ sender: Any) {
        Auth.shared.activateUser(phone: numberField.text ?? "" ,code: codeField.text ?? "") { (success) in
            
        }
    }
    
    @IBAction func resendAction(_ sender: Any) {
        Auth.shared.resendCode(code: numberField.text ?? "") { (success) in
            
        }
    }
}
