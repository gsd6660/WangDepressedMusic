//
//  CMHomeSectionHeaderView.swift
//  WangDepressedMusic
//
//  Created by gsd on 2021/8/19.
//

import UIKit

class CMHomeSectionHeaderView: UIView {

    var titleLabel : UILabel!
    var moreBtn : UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        
        self.titleLabel = UILabel()
        self.titleLabel.text = "排行榜"
        self.titleLabel.textColor = .white
        self.titleLabel.font = .systemFont(ofSize: 18)
        self.addSubview(self.titleLabel)
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalTo(self).offset(10)
        }
        
        self.moreBtn = UIButton.init(type: .custom)
        self.moreBtn.setTitle("查看更多", for: .normal)
        self.moreBtn.setTitleColor(.white, for: .normal)
        self.moreBtn.titleLabel?.font = .systemFont(ofSize: 15)
        self.addSubview(self.moreBtn)
        self.moreBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.centerY.equalTo(self).offset(10)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
