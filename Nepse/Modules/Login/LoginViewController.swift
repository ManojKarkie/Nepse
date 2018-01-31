//
//  LoginViewController.swift
//  Nepse
//
//  Created by Rojan on 9/5/2560 BE.
//  Copyright © 2560 Swiftech. All rights reserved.
//

import UIKit
import MBProgressHUD

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
        Auth.shared.loginIn(username: email_txt.text ?? "", password: password_txt.text ?? "", success: { (success) in
            status = .loggedIn
            appdelegate?.setupSideMenu()
        }) { (error) in
            self.showError(error: error, completion: nil)
        }
       
    }
}

// MARK: SideMenu

extension UIViewController {
    
    @objc func showSideMenu() {
        self.sideMenuController?.toggleLeftViewAnimated()
    }
}

extension UIViewController {
    
    func showError(error: String, completion: (() -> Void)?) {
            self.alert(message: error)
    }
    
    func showSuccess(message: String) {
        self.alert(message: message, title: "Success", okAction: {
            self.navigationController?.popViewController(animated: true)
        })
    }
}

extension UIViewController {
    
    func confirmationAlert(title: String, message: String, confirmTitle: String, style: UIAlertActionStyle = .destructive, confirmAction: @escaping () -> Void) {
        let deleteActionSheetController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: confirmTitle, style: style) {
            action -> Void in
            confirmAction()
        }
        
        let cancelAction = UIAlertAction(title: "cancelCap", style: .cancel) { action -> Void in
            
        }
        
        deleteActionSheetController.addAction(deleteAction)
        deleteActionSheetController.addAction(cancelAction)
        
        self.present(deleteActionSheetController, animated: true, completion: nil)
    }
    
    func alert(message: String?, title: String? = "Error", okAction: (()->())? = nil ) {
        let alertController = getAlert(message: message, title: title)
        alertController.addAction(title: "Ok", handler: okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertWithOkCancel(message: String?, title: String? = "Error", okTitle: String? = "Ok", cancelTitle: String? = "cancelCap", cancelStyle: UIAlertActionStyle = .default, okAction: (()->())? = nil, cancelAction: (()->())? = nil) {
        let alertController = getAlert(message: message, title: title)
        alertController.addAction(title: okTitle, handler: okAction)
        alertController.addAction(title: cancelTitle, style: cancelStyle, handler: cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func getAlert(message: String?, title: String?) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    func present(_ alert: UIAlertController, asActionsheetInSourceView sourceView: Any) {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            alert.modalPresentationStyle = .popover
            if let presenter = alert.popoverPresentationController {
                if sourceView is UIBarButtonItem {
                    presenter.barButtonItem = sourceView as? UIBarButtonItem
                }else if sourceView is UIView {
                    let view = sourceView as! UIView
                    presenter.sourceView = view
                    presenter.sourceRect = view.bounds
                }
            }
        }
        self.present(alert, animated: true, completion: nil)
    }
}


extension UIAlertController {
    func addAction(title: String?, style: UIAlertActionStyle = .default, handler: (()->())? = nil) {
        let action = UIAlertAction(title: title, style: style, handler: {_ in
            handler?()
        })
        self.addAction(action)
    }
}

struct Associate {
    static var hud: UInt8 = 0
}

// MARK: HUD
extension UIViewController {

    private func setProgressHud() -> MBProgressHUD {
        let progressHud:  MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        progressHud.tintColor = UIColor.darkGray
        progressHud.removeFromSuperViewOnHide = true
        objc_setAssociatedObject(self, &Associate.hud, progressHud, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return progressHud
    }

    var progressHud: MBProgressHUD {
        if let progressHud = objc_getAssociatedObject(self, &Associate.hud) as? MBProgressHUD {
            progressHud.isUserInteractionEnabled = true
            return progressHud
        }
        return setProgressHud()
    }

    var progressHudIsShowing: Bool {
        return self.progressHud.isHidden
    }

    func showProgressHud() {
        self.progressHud.show(animated: false)
    }

    func hideProgressHud() {
        self.progressHud.label.text = ""
        self.progressHud.completionBlock = {
            objc_setAssociatedObject(self, &Associate.hud, nil, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        self.progressHud.hide(animated: false)
    }
}

