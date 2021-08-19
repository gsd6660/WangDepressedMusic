//
//  CMHomeViewController.swift
//  WangDepressedMusic
//
//  Created by gsd on 2021/8/18.
//

import UIKit

class CMHomeViewController: CMBaseViewController {
    
    let segmentedView = JXSegmentedView()
    var segmentedDataSource = JXSegmentedTitleDataSource()
    
    lazy var listContainerView: JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(dataSource: self)
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = (segmentedView.selectedIndex == 0)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        segmentedDataSource.isTitleZoomEnabled = false
        segmentedDataSource.titleNormalFont = .systemFont(ofSize: 15)
        segmentedDataSource.titleSelectedFont = .boldSystemFont(ofSize: 17)
        segmentedDataSource.titleNormalColor = UIColor.init(hexString: "#CFD0D0")!
        segmentedDataSource.titleSelectedColor = .white
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.titles = ["1111","2222","3333","4444","5555","6666"]
        
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = 20
        indicator.indicatorColor = .white
        
        segmentedView.indicators = [indicator]
        segmentedView.dataSource = segmentedDataSource
        segmentedView.delegate = self
        view.addSubview(segmentedView)
        
        segmentedView.listContainer = listContainerView
        view.addSubview(listContainerView)
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        segmentedView.frame = CGRect(x: 0, y: kNavBarHeight, width: kScreenW, height: 40)
        listContainerView.frame = CGRect(x: 0, y: kNavBarHeight + 40, width: kScreenW, height: kScreenH - 40 - kNavBarHeight - kTabbarHeight)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    
}

extension CMHomeViewController:JXSegmentedViewDelegate{
    
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
       

        navigationController?.interactivePopGestureRecognizer?.isEnabled = (segmentedView.selectedIndex == 0)
    }
    
    
    
}

extension CMHomeViewController:JXSegmentedListContainerViewDataSource{
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        
        return 6
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        
        return CMHomeSubViewController()
    }
    
}
