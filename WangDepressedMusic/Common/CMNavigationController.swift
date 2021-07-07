//
//  CMNavigationController.swift
//  WangDepressedMusic
//
//  Created by guxiang on 2021/7/1.
//

import UIKit

class CMNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
        self.navigationBar.barStyle = .default
        if self.responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            self.interactivePopGestureRecognizer?.delegate = self
            self.delegate = self
        }
         
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.responds(to: #selector(getter: interactivePopGestureRecognizer)) && animated == true{
            self.interactivePopGestureRecognizer?.isEnabled = false
        }
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        if self.responds(to: #selector(getter: interactivePopGestureRecognizer)) && animated == true {
            self.interactivePopGestureRecognizer?.isEnabled = false
        }
        return super.popToRootViewController(animated: animated)
    }
    
    
    public override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        if self.responds(to: #selector(getter: interactivePopGestureRecognizer)) && animated == true {
            self.interactivePopGestureRecognizer?.isEnabled = false
        }
        return super.popToViewController(viewController, animated: animated)
    }
}

extension CMNavigationController : UIGestureRecognizerDelegate,UINavigationControllerDelegate{
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if interactivePopGestureRecognizer?.isEnabled == false {
            return false
        }
        
        if gestureRecognizer == self.interactivePopGestureRecognizer {
            return self.viewControllers.count > 1
        }
        return true
    }
    
}
