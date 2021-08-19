//
//  CMHomeRankSubCell.swift
//  WangDepressedMusic
//
//  Created by gsd on 2021/8/19.
//

import UIKit

class CMHomeRankSubCell: UICollectionViewCell {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleLabel : UILabel!
    var timeLabel : UILabel!
    var imageV :UIImageView!
    var playBtn : UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-10)
        }
        bgView.layer.cornerRadius = 10
        
        self.contentView.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.contentView)
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(-10)
        }
        
        addTableViewHeaderView()
        
    }
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .random
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.delegate = self
        view.dataSource = self
        view.bounces = false
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.contentInsetAdjustmentBehavior = .never
        view.automaticallyAdjustsScrollIndicatorInsets = false
        return view
    }()
    
    func addTableViewHeaderView(){
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 80))
        headerView.backgroundColor = .clear
        
        self.tableView.tableHeaderView = headerView;
        
        self.titleLabel = UILabel.init()
        self.titleLabel.font = .systemFont(ofSize: 17)
        self.titleLabel.text = "热歌榜";
        self.titleLabel.textColor = .white
        headerView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(headerView.snp.centerY).offset(-10)
        }
        
        self.timeLabel = UILabel()
        self.timeLabel.text = "8-19"
        self.timeLabel.textColor = .white
        self.timeLabel.font = .systemFont(ofSize: 13)
        headerView.addSubview(self.timeLabel)
        self.timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
        }
        
        self.imageV = UIImageView()
        self.imageV.backgroundColor = .red
        self.imageV.cornerRadius = 10
        self.imageV.borderColor = .blue
        self.imageV.borderWidth = 2
        headerView.addSubview(self.imageV)
        self.imageV.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.equalTo(0)
            make.width.height.equalTo(60)
        }
        
        
    }
    
    
}

extension CMHomeRankSubCell : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cells") as? CMHomeRankSubTableCell
        if  cell == nil{
            cell = CMHomeRankSubTableCell.init(style: .default, reuseIdentifier: "cells")
        }
        cell?.rankLabel.text = "\(indexPath.row + 1)"
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
