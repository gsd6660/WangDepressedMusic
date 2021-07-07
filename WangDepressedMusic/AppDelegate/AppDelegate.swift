//
//  AppDelegate.swift
//  WangDepressedMusic
//
//  Created by guxiang on 2021/6/30.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MyThemes.restoreLastTheme()
        window = UIWindow.init()
        self.window?.rootViewController = CMTabBarViewController()
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        MyThemes.saveLastTheme()
    }
   


}


