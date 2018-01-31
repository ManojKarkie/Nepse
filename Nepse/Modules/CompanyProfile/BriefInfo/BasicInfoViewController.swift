//
//  BasicInfoViewController.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/29/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class BasicInfoViewController: UIViewController , IndicatorInfoProvider{

    @IBOutlet weak var widthStack: NSLayoutConstraint!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var staticTop: NSLayoutConstraint!
    
    @IBOutlet weak var descrField: UILabel!
    @IBOutlet weak var addrLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var urlLabe: UILabel!
    @IBOutlet weak var ltpLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    @IBOutlet weak var tlsLabel: UILabel!
    @IBOutlet weak var pdpValLabel: UILabel!
    @IBOutlet weak var reverseLabel: UILabel!
    @IBOutlet weak var epsLabel: UILabel!
    @IBOutlet weak var peLabel: UILabel!
    @IBOutlet weak var bookValLabel: UILabel!
    @IBOutlet weak var companyTitleLabel: UILabel!
    
    
    private let service = CompanyService()
    var companyCode:String?
    fileprivate var companyProfile = CompanyProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.staticTop.constant = stackView.frame.height + 15
        fetchProfileData()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "BRIEF INFO")
    }
    
    private func fetchProfileData() {
        service.fetchCompanyProfile(companyCode: companyCode ?? "", success: { (model) in
            self.companyProfile = model
            self.setupData()
        }) { (error) in
            
        }
    }
    
    private func setupData() {
        self.descrField.text = self.companyProfile.descr
        self.addrLabel.text = self.companyProfile.addr
        self.bookValLabel.text = self.companyProfile.bookValue
        self.diffLabel.text = "\(self.companyProfile.diff ?? "") (\(self.companyProfile.diffP ?? ""))"
        self.emailLabel.text = self.companyProfile.email
        self.epsLabel.text = self.companyProfile.eps
        self.ltpLabel.text = self.companyProfile.ltp
        self.pdpValLabel.text = self.companyProfile.pdpVal
        self.peLabel.text = self.companyProfile.pe
        self.reverseLabel.text = self.companyProfile.reserve
        self.companyTitleLabel.text = self.companyProfile.name
    }
}
