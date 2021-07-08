//
//  CMDiscoverViewController.swift
//  WangDepressedMusic
//
//  Created by guxiang on 2021/7/1.
//

import UIKit

class CMDiscoverViewController: CMBaseViewController {
    
    var dataSource = [Any]()
    var data = [Any]()
    let disPoseBg = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        
        var parmters = [String:Any]()
        parmters.updateValue("1014307", forKey: "uid")
        parmters.updateValue("token", forKey: "6c407ae42b1c8212de7e5959ae3fd379")
//        HomeAPI.request(.NewHomeLoad(parmDic: parmters))()
//            .subscribe { (model) in
//                self.data.append(model)
//                self.tableView.reloadData()
//            } onError: { (error) in
//
//            }.disposed(by: disPoseBg)
        let vm = HomeViewModel()
        vm.loadHomeApi()
            .subscribe { (json) in
                print(json)
            } onError: { (error) in
                print(error)
            }.disposed(by: disPoseBg)

    }
    
    
    

    lazy var tableView : UITableView = {
        let tab = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: kScreenH - kTabbarHeight - kNavBarHeight))
        tab.delegate = self
        tab.dataSource = self
        return tab
    }()
}


extension CMDiscoverViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "bannerCell")
            if cell == nil {
                cell = CMBannerCell.init(style: .default, reuseIdentifier: "bannerCell")
            }
            return cell!
        }else{
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            if  cell == nil {
                cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
            }
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        }
        return 44
    }
}

