//
//  AppDelegate.swift
//  FirebaseAuthentication
//
//  Created by Javier Quiles on 03/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UINavigationControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navController = UINavigationController(rootViewController: FALoginViewController())

        navController.delegate = self
        navController.setNavigationBarHidden(false, animated: false)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        return true
    }

}
