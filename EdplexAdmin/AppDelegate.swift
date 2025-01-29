//
//  AppDelegate.swift
//  EdplexLite
//
//  Created by MEHUL MODHVADIYA on 03/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let nav = UINavigationController(rootViewController: viewController)
        window!.rootViewController = nav
        return true
    }
}

