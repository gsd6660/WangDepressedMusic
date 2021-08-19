//
//  CMTabBarViewController.swift
//  WangDepressedMusic
//
//  Created by guxiang on 2021/7/1.
//

import UIKit
import RxCocoa
class CMTabBarViewController: UITabBarController {
 
    
    private let tabbarView: CMTabbar = {
        let view = CMTabbar.init(frame: .zero, titles: ["发现","博客","我的","K歌","云村"], images: ["cm8_btm_icn_discovery","cm8_btm_icn_voice","cm8_btm_icn_music","cm8_btm_icn_karaoke","cm8_btm_icn_friend"], selectedImage: ["cm8_btm_icn_discovery_prs","cm8_btm_icn_voice_prs","cm8_btm_icn_music_prs","cm8_btm_icn_karaoke_prs","cm8_btm_icn_friend_prs"], backgroudImage: "")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
//        tabBar.isHidden = true
        self.view.backgroundColor = .black
        self.tabBar.barTintColor = .black
        addVCs()
//        self.tabbarView.backgroundColor = .white
//        self.tabbarView.delegate = self
//        self.view.addSubview(self.tabbarView)
//        self.tabbarView.frame = CGRect(x: 0, y: self.tabBar.frame.origin.y - kSafeBottomHeight, width: kScreenW, height: kTabbarHeight)
//        view.bringSubviewToFront(self.tabBar)

    }
 
    func addVCs() {
        addChildViewController(CMHomeViewController(),
                               title: "首页",
                               image: "icon_tab_exp",
                               selectImage: "icon_tab_exp_on")
        addChildViewController(CMMeViewController(),
                               title: "我的",
                               image: "icon_tab_my",
                               selectImage: "icon_tab_my_on")
      
        
        
    }
    
    
    private func addChildViewController(_ child: UIViewController, title: String, image:String,selectImage:String) {
        
        child.tabBarItem.title = title
        child.tabBarItem.image = UIImage.init(named: image)?.withRenderingMode(.alwaysOriginal)
        child.tabBarItem.selectedImage = UIImage.init(named: selectImage)?.withRenderingMode(.alwaysOriginal)
        child.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.init(hexString: "#59FED9")!], for: .selected)
        child.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.white], for: .normal)
        let nav = CMNavigationController.init(rootViewController: child)
        addChild(nav)
    }
}

extension CMTabBarViewController: TabBarViewDegate{
    func TabbarViewDidSelect(index: NSInteger) {
        self.selectedIndex = index
    }
}
