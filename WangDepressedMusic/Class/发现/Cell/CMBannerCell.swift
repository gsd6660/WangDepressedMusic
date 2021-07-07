//
//  CMBannerCell.swift
//  WangDepressedMusic
//
//  Created by guxiang on 2021/7/5.
//

import UIKit

class CMBannerCell: CMBaseTableViewCell {

    
    lazy var bannerView: SDCycleScrollView = {
        let view = SDCycleScrollView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.imageURLStringsGroup = ["https://www.baidu.com/img/540x258_2179d1243e6c5320a8dcbecd834a025d.png","https://www.baidu.com/img/540x258_2179d1243e6c5320a8dcbecd834a025d.png","https://www.baidu.com/img/540x258_2179d1243e6c5320a8dcbecd834a025d.png","https://www.baidu.com/img/540x258_2179d1243e6c5320a8dcbecd834a025d.png"]
        return view
    }()
    
    override func initSubViews() {
        self.contentView.addSubview(bannerView)
        bannerView.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.bottom.right.equalTo(-10)
        }
    }

    
    
}
