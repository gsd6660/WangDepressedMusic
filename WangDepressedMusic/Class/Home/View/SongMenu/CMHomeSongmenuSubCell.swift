//
//  CMHomeSongmenuSubCell.swift
//  WangDepressedMusic
//
//  Created by gsd on 2021/8/19.
//

import UIKit

class CMHomeSongmenuSubCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.contentView.addSubview(imageV)
        self.contentView.addSubview(self.descLabel)
        
        imageV.snp.makeConstraints { (make) in
            make.left.top.equalTo(0)
            make.width.height.equalTo(self.contentView.frame.size.width)
        }
        imageV.cornerRadius = 10
        descLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageV.snp.bottom)
            make.left.right.bottom.equalTo(0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var imageV: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .random
        return view
    }()
    
    lazy var descLabel: UILabel = {
        let view = UILabel()
        view.text = "歌单简介"
        view.numberOfLines = 2
        view.textColor = .white
        view.font = .systemFont(ofSize: 13)
        return view
    }()
    
}
