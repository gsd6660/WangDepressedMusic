//
//  CMBaseViewController.swift
//  WangDepressedMusic
//
//  Created by guxiang on 2021/7/2.
//

import UIKit

class CMBaseViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.theme_backgroundColor = ThemeList.mainBackgroundColor
        updateTheme()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard
            #available(iOS 13.0, *),
            traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)
            else { return }
        
        updateTheme()
    }

    private func updateTheme() {
        guard #available(iOS 12.0, *) else { return }
        
        switch traitCollection.userInterfaceStyle {
        case .light:
            MyThemes.switchNight(isToNight: false)
        case .dark:
            MyThemes.switchNight(isToNight: true)
        case .unspecified:
            break
        @unknown default:
            break
        }
    }
}
