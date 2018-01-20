//
//  AppDelegate.swift
//  Nepse
//
//  Created by Manoj Karki on 9/3/17.
//  Copyright © 2017 Swiftech. All rights reserved.
//

import UIKit
import LGSideMenuController

let appdelegate = UIApplication.shared.delegate as? AppDelegate
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
        return true
    }

    private func setupNavBar() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white]
        navBarAppearance.barTintColor = UIColor(hex: "#234E66")
        navBarAppearance.tintColor = UIColor.white
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.isTranslucent = false
    }
    
    private func entryPoint() {
        if isAuthenticated() {
            self.setupSideMenu()
        }else{
            self.window?.rootViewController = UINavigationController.init(rootViewController: Wireframe.shared.getMain())
        }
    }

}

extension AppDelegate {
    
    func setupSideMenu() {
        let homeVc = UINavigationController(rootViewController: Wireframe.shared.getDashboard())
        let leftVc = Wireframe.shared.getSideMenu()
        let sideMenuController = LGSideMenuController(rootViewController: homeVc, leftViewController: leftVc, rightViewController: nil)
        sideMenuController.leftViewPresentationStyle = .scaleFromLittle
        sideMenuController.leftViewWidth = UIScreen.main.bounds.width - 70.0
        appdelegate?.window?.rootViewController = sideMenuController
        
    }
    
    func isAuthenticated() -> Bool {
        if let auth = realm.objects(AuthModel.self).first, auth.token != "" {
            UserModel.shared = auth.user?.normalModel() ?? UserModel()
            return true
        }else{
            return false
        }
    }
}
