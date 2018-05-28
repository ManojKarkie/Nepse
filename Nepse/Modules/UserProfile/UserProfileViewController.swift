//
//  UserProfileViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 2/15/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import Material

class UserProfileViewController: UIViewController {

    @IBOutlet weak var fullNameField: TextField!
    @IBOutlet weak var emailField: TextField!
    @IBOutlet weak var addressField: TextField!
    @IBOutlet weak var phoneField: TextField!
    @IBOutlet weak var secondaryPhoneField: TextField!
    @IBOutlet weak var securityField: TextField!
    @IBOutlet weak var securityAnsField: TextField!
    @IBOutlet weak var passwordField: TextField!
    @IBOutlet weak var pinFIeld: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFields()
    }
    
    private func setupFields() {
        fullNameField.setup("Full Name")
        emailField.setup("Email Address")
        addressField.setup("Address")
        phoneField.setup("Phone Number (Promary)")
        secondaryPhoneField.setup("Phone Number (Secondary)")
        securityField.setup("Security Question")
        securityAnsField.setup("Security Answer")
        passwordField.setup("Password")
        pinFIeld.setup("Pin")
    }

}

extension TextField {
    
    func setup(_ placeholder: String) {
        self.placeholder = placeholder
        self.placeholderNormalColor = UIColor(hex: "#2D6687")
        self.dividerNormalColor = UIColor(hex: "#2D6687")
        self.placeholderVerticalOffset = 10
        self.placeholderActiveColor = UIColor(hex: "#2D6687")
        self.dividerActiveColor = UIColor(hex: "#2D6687")
    }
}
