//
//  AppDelegate.swift
//  Hard_Work🥵🥵
//
//  Created by Sherbekjon Rustamov on 24/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       window = UIWindow()
        let vc = MainVC(nibName: "MainVC", bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }

  

}

