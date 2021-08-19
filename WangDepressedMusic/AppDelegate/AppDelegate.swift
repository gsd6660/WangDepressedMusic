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
        UIApplication.shared.statusBarStyle = .lightContent
        initConfig()
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        MyThemes.saveLastTheme()
    }
   
    
       func initConfig(){
           // 设置全局toast的样式
           var style = ToastStyle()
           style.backgroundColor = UIColor.black.withAlphaComponent(0.8)
           style.cornerRadius = 6
           style.horizontalPadding = 10
           style.verticalPadding = 12
           style.messageAlignment = .center
           style.titleAlignment = .center
           style.titleFont = UIFont.systemFont(ofSize: 17)
           style.messageFont = UIFont.systemFont(ofSize: 15)
           
           ToastManager.shared.style = style
           ToastManager.shared.position = .center
           ToastManager.shared.duration = 1
           
           SHFullscreenPopGesture.configure()
           
       }


}


