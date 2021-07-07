//
//  Toast_Swift.swift
//  LXSH
//
//  Created by guxiang on 2021/6/3.
//

import Toast_Swift

struct Toast {
    
    static func show(title:String? = nil,message: String? = nil, on: UIView? = nil){
        if let superView = on {
            superView.makeToast(message)
        }else{
            let superView = UIApplication.shared.windows.last
            superView?.makeToast(message)
        }
    }
}
