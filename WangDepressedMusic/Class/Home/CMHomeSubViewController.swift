//
//  CMHomeSubViewController.swift
//  WangDepressedMusic
//
//  Created by gsd on 2021/8/18.
//

import UIKit

class CMHomeSubViewController: CMBaseViewController {

    let viewModel = HTViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .random
        
        self.view.addSubview(self.collectView)
        self.collectView.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.view)
            make.left.top.bottom.right.equalTo(0)

        }
    }
    
    
    lazy var collectView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let view = UICollectionView.init(frame:.zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor.clear
        view.delegate = self
        view.dataSource = self
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.automaticallyAdjustsScrollIndicatorInsets = false
        view.contentInsetAdjustmentBehavior = .never
        
        view.register(CMHomeRankCell.self, forCellWithReuseIdentifier: "rankCell")
        
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.register(CMHomeSongmenuCell.self, forCellWithReuseIdentifier: "songmenuCell")
        
        view.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView")
        
        return view
    }()
}




extension CMHomeSubViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 || section == 1 {
            return 1
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rankCell", for: indexPath) as! CMHomeRankCell
            
            cell.backgroundColor = .clear
            return cell
        }else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "songmenuCell", for: indexPath) as! CMHomeSongmenuCell
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .random
            return cell
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: kScreenW, height: 400)
           
        }else if indexPath.section == 1{
            return CGSize(width: kScreenW, height: (kScreenW - 45.0) / 2 + 45)
        }else{
            return CGSize(width: (kScreenW - 40.0) / 2, height: (kScreenW - 40.0) / 2 + 45)
        }
    }

   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath)
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = CMHomeSectionHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 40))
            reusableView.addSubview(headerView)
            if indexPath.section == 0 {
                headerView.moreBtn.isHidden = true
                headerView.titleLabel.text = "排行榜"
            }else{
                headerView.moreBtn.isHidden = false
                headerView.titleLabel.text = "各种风味小情歌"
            }
        }
        
        return reusableView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
 
        return CGSize(width: kScreenW, height: 50)
        
    }
    
}



extension CMHomeSubViewController : JXSegmentedListContainerViewListDelegate{
    func listView() -> UIView {
        return view
    }
}
