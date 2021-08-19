//
//  CMHomeRankSubTableCell.swift
//  WangDepressedMusic
//
//  Created by gsd on 2021/8/19.
//

import UIKit

class CMHomeRankSubTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.addSubview(rankLabel)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(descLabel)
        rankLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalTo(self.contentView)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(rankLabel.snp.right).offset(10)
            make.top.equalTo(15)
        }
        descLabel.snp.makeConstraints { (make) in
            make.left.equalTo(rankLabel.snp.right).offset(10)
            make.top.equalTo(self.nameLabel.snp.bottom).offset(5)
        }
    }
    
    lazy var rankLabel: UILabel = {
        let view = UILabel()
        view.text = "1"
        view.textColor = .white
        view.font = .systemFont(ofSize: 14)
        
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.text = "歌曲名字"
        view.textColor = .white
        view.font = .systemFont(ofSize: 15)
        return view
    }()
    
    lazy var descLabel: UILabel = {
        let view = UILabel()
        view.text = "作者名字"
        view.textColor = .white
        view.font = .systemFont(ofSize: 12)
        return view
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
