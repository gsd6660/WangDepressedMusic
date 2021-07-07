//
//  ThemeManager.swift
//  WangDepressedMusic
//
//  Created by guxiang on 2021/7/1.
//

import Foundation
import SwiftTheme

enum ThemeList{
    static let mainBackgroundColor:ThemeColorPicker = ["#ffffff","#0A0A0B"]
    static let textColor: ThemeColorPicker = ["#000000","#ffffff"]
    
    static let barTextColors = ["#000000","#ffffff"]
    static let barTextColor = ThemeColorPicker.pickerWithColors(barTextColors)
    static let barTintColor: ThemeColorPicker = ["#ffffff", "#000000"]
    
}

private let lastThemeIndexKey = "lasetdThemeKey"
private let defaults = UserDefaults.standard

enum MyThemes :Int{
    case daylight = 0
    case night = 1
    
//    static var current: MyThemes{ return MyThemes(rawValue: ThemeManager.currentThemeIndex)!}
    static var current = MyThemes.daylight
    static var before = MyThemes.night
    
    // MARK: - switch Theme
    
    static func switchTo(theme: MyThemes){
        before = current
        ThemeManager.setTheme(index: theme.rawValue)
    }
    
    //MARK:- Switch night
    
    static func switchNight(isToNight: Bool){
        switchTo(theme: isToNight ? .night : .daylight)
    }
    
    static func isNight() -> Bool{
        return current == .night
    }
    
    //MARK:- Save & Restore
    
    static func restoreLastTheme(){
        switchTo(theme: MyThemes(rawValue: defaults.integer(forKey: lastThemeIndexKey))!)
    }
    
    static func saveLastTheme(){
        defaults.set(ThemeManager.currentThemeIndex,forKey: lastThemeIndexKey)
    }
}
