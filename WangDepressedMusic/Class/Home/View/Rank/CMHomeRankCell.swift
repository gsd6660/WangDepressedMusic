//
//  CMHomeRankCell.swift
//  WangDepressedMusic
//
//  Created by gsd on 2021/8/19.
//

import UIKit

class CMHomeRankCell: UICollectionViewCell {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(collectView)
        collectView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
        }
    }
    
    
    lazy var collectView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let view = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.delegate = self
        view.dataSource = self
        view.bounces = false
        view.register(CMHomeRankSubCell.self, forCellWithReuseIdentifier: "subCells")
        view.automaticallyAdjustsScrollIndicatorInsets = false
        view.contentInsetAdjustmentBehavior = .never
        view.alwaysBounceVertical = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    
}
extension CMHomeRankCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subCells", for: indexPath) as! CMHomeRankSubCell
        cell.contentView.backgroundColor = .clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: kScreenW - 100, height: self.contentView.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
    
    
    
}
