//
//  CMMeViewController.swift
//  WangDepressedMusic
//
//  Created by gsd on 2021/8/18.
//

import UIKit

class CMMeViewController: CMBaseViewController {

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

   

}
