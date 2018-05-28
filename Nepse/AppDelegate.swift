//
//  AppDelegate.swift
//  Nepse
//
//  Created by Manoj Karki on 9/3/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit
import LGSideMenuController
import IQKeyboardManagerSwift
import DropDown

let appdelegate = UIApplication.shared.delegate as? AppDelegate
var status: GlobalConstant.Status = .notLogged
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UINavigationController().navigationBar.shadowImage = UIImage()
        let nav = UINavigationController.init(rootViewController: Wireframe.shared.getMain())
        self.window?.rootViewController = nav
        UIApplication.shared.statusBarStyle = .lightContent
        setupNavBar()
        entryPoint()
        IQKeyboardManager.sharedManager().enable = true
        DropDown.startListeningToKeyboard()
        return true
    }

    private func setupNavBar() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white]
        navBarAppearance.barTintColor = UIColor(hex: "#0077B5")
        navBarAppearance.tintColor = UIColor.white
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.isTranslucent = false
        
    }
    
    @objc func showLeftView(vc: UIViewController) {
        vc.sideMenuController?.showLeftViewAnimated()
    }
    
    private func entryPoint() {
        if isAuthenticated() {
            Auth.shared.validateLogin()
            self.setupSideMenu()
        }else{
            status = .notLogged
            self.window?.rootViewController = UINavigationController.init(rootViewController: Wireframe.shared.getMain())
        }
    }

}

extension AppDelegate {
    
    func setupSideMenu() {
        let homeVc = UINavigationController(rootViewController: Wireframe.shared.getDashboard())
        let leftVc = Wireframe.shared.getSideMenu()
        let sideMenuController = LGSideMenuController(rootViewController: homeVc, leftViewController: leftVc, rightViewController: nil)
        sideMenuController.leftViewPresentationStyle = .slideAbove
        sideMenuController.leftViewWidth = UIScreen.main.bounds.width
        appdelegate?.window?.rootViewController = sideMenuController
        
    }
    
    func isAuthenticated() -> Bool {
        if let auth = realm.objects(AuthModel.self).first, auth.token != "" {
            AuthNormalModel.shared = auth.normalModel()
            UserModel.shared = auth.user?.normalModel() ?? UserModel()
            status = .loggedIn
            return true
        }else{
            return false
        }
    }
}
