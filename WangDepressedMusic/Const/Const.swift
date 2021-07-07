//
//  Const.swift
//  LXSH
//
//  Created by guxiang on 2021/6/3.
//

import UIKit

//屏幕宽高
let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

var isiPoneX : Bool{
    var isX = false
    if #available(iOS 11.0, *) {
        let bottom : CGFloat = UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0
        isX = bottom > 0.0
    }
    return isX
}

//TabBar距离底部区高度

let kSafeBottomHeight : CGFloat = isiPoneX ? 34.0:0.0
/// 状态栏高度
let StatusBarHeight = UIApplication.shared.statusBarFrame.size.height
/// TabBar高度
var kTabbarHeight : CGFloat = isiPoneX ? 49.0 + kSafeBottomHeight : 44
/// 导航栏高度
let kNavBarHeight : CGFloat = isiPoneX ? 88.0 : 64.0


/// 当前屏幕比例
public let Scare = UIScreen.main.scale
/// 画线宽度 不同分辨率都是一像素
public let LineHeight = CGFloat(Scare >= 1 ? 1/Scare: 1)

func ScaleW(_ width:CGFloat,fit:CGFloat = 375.0) -> CGFloat {
    return kScreenW / fit * width
}

func ScaleH(_ height:CGFloat, fit:CGFloat = 812.0) -> CGFloat {
    return kScreenH / fit * height
}

func Scale(_ value: CGFloat) -> CGFloat {
    return ScaleW(value)
}

//MARK: APP名称
var displayName : String?{
    return Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String
}


//MARK: app 的bundleid
var bundleID: String? {
    return Bundle.main.bundleIdentifier
}

//MARK: app版本号
var version: String? {
    return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
}

//MARK: 设备名称
var deviceName: String {
    return UIDevice.current.localizedModel
}

//MARK: 当前系统版本
var systemVersion: String {
    return UIDevice.current.systemVersion
}



// MARK: - 获取当前windows
let windows = UIApplication.shared.windows.last

// MARK: - 获取view的父控制器


