//
//  LoadView.swift
//  LXSH
//
//  Created by guxiang on 2021/6/4.
//

import UIKit

import SwiftGifOrigin

extension MBProgressHUD{
    
    class func show(text: String, icon:String,view:UIView?){
        var currenView = view
        if  currenView == nil {
            currenView = UIApplication.shared.windows.last
        }
        let hud = MBProgressHUD.showAdded(to: currenView!, animated: true)
        hud.label.text = text
        hud.customView = UIImageView.init(image: UIImage.init(named: icon))
        hud.mode = .customView
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 1)
    }
    
    class public func showError(error:String, view:UIView?){
        self.show(text: error, icon:"", view: view);
    }
    
    class public func showSuccess(success: String, view: UIView?){
        self.show(text: success, icon: "", view: view)
    }
    
    class func showMessage(message: String ,view: UIView?){
        var currenView = view
        if currenView == nil {
            currenView = UIApplication.shared.windows.last
        }
        let hud = MBProgressHUD.showAdded(to: currenView!, animated: true)
        hud.label.text = message
        hud.removeFromSuperViewOnHide = true
        hud.show(animated: true)
    }
    
    
    class public func showSuccess(success: String){
        self.showSuccess(success: success, view: nil)
    }
    
    class public func showError(error:String){
        self.showError(error: error, view: nil)
    }
    
    class func showMessage(message: String) {
        self.showMessage(message: message, view: nil)
       
    }
    
    class func hideHUDForView(view:UIView){
        self.hide(for: view, animated: true)
    }
    
    
    // MARK: -创建一个hud
   class func createHud()->MBProgressHUD{
        let hud = MBProgressHUD.showAdded(to: UIApplication.shared.windows.last!, animated: true)
        hud.areDefaultMotionEffectsEnabled = false
        hud.removeFromSuperViewOnHide = true
        hud.label.text = ""
        hud.detailsLabel.font = .systemFont(ofSize: 14)
        hud.backgroundView.color = .clear
        hud.backgroundView.style = .solidColor
        hud.bezelView.style = .solidColor
        hud.bezelView.color = .clear
        
        hud.mode = .customView
        
        return hud
    }
    // MARK: - 显示loading
    class func showLoading(text:String? = nil){
        let hud = self.createHud()
        let gifImg = UIImageView.init()
        gifImg.loadGif(name: "loading")
        hud.customView = gifImg
        hud.customView?.size = gifImg.intrinsicContentSize
        hud.alpha = 1
    }
    // MARK: - 隐藏loading
    class func hideLoading(){
        self.hideHUDForView(view: UIApplication.shared.windows.last!)
    }
    
    
}

// MARK: - 奇怪的知识又增加了  : 控件内置大小
extension UIImageView{
    open override var intrinsicContentSize: CGSize{
        return CGSize.init(width: 80, height: 80)
    }
}
