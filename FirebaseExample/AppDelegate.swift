//
//  AppDelegate.swift
//  FirebaseAuthentication
//
//  Created by Javier Quiles on 03/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UINavigationControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navController = UINavigationController(rootViewController: LoginInstance.resolveViewController())

        navController.delegate = self
        navController.setNavigationBarHidden(false, animated: false)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        // Firebase
        FirebaseApp.configure()

        // GoogleAuth
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID

        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance()?.handle(url) ?? false
            || ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation])
    }

}

