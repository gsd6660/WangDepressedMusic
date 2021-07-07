//
//  CMVoiceViewController.swift
//  WangDepressedMusic
//
//  Created by guxiang on 2021/7/1.
//

import UIKit

class CMVoiceViewController: CMBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let sw = UISwitch.init(frame: CGRect.init(x: 100, y: 200, width: 100, height: 30))
        self.view.addSubview(sw)
        sw.addTarget(self, action: #selector(clickBtn(sender:)), for: .touchUpInside)
    }
    
    @objc func clickBtn(sender:UISwitch){
        MyThemes.switchNight(isToNight: sender.isOn)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
