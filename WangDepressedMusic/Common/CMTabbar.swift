//
//  CMTabbar.swift
//  WangDepressedMusic
//
//  Created by guxiang on 2021/7/3.
//

import UIKit


@objc protocol TabBarViewDegate{
    func TabbarViewDidSelect(index: NSInteger)
}

class CMTabbar: UIView {
    
    weak var delegate: TabBarViewDegate?
    let titles : [String]
    let images : [String]
    let selectImage : [String]
    let backgroudImage : String
    var selectedBtn : UIButton!
    var buttons = [UIButton]()//储存buttons 数组
    var backgroundImages = [UIImageView]()
    
    var selectBackgorundImageV : UIImageView!
    
    let select = UIControl.State.selected.rawValue
    let high = UIControl.State.highlighted.rawValue
    
    init(frame:CGRect, titles:[String],images: [String],selectedImage: [String],backgroudImage:String) {
        self.titles = titles
        self.images = images
        self.selectImage = selectedImage
        self.backgroudImage = backgroudImage
        super.init(frame: frame)
        initSubView()
        
        theme_backgroundColor = ThemeList.mainBackgroundColor
        let line = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 0.5))
        line.backgroundColor = .separator
        self.addSubview(line)
        
    }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initSubView(){
        for (index,title) in self.titles.enumerated() {
            
            let backgroudImageView = UIImageView(frame: CGRect(x: CGFloat(index) * kScreenW/5 + kScreenW/15 - 1.5, y: 6.5, width: kScreenW/15 + 3, height: kScreenW/15 + 3))
            backgroudImageView.image = UIImage.init(named: "tab_sel")
            self.addSubview(backgroudImageView)
            backgroudImageView.isHidden = true
            backgroudImageView.tag = 10000+index
            self.backgroundImages.append(backgroudImageView)
            
            let btn = UIButton.init(type: .custom)
            btn.titleLabel?.font = .systemFont(ofSize: 12)
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(.lightGray, for: .normal)
            btn.setImage(UIImage.init(named: images[index]), for: .normal)
            btn.setTitleColor(UIColor.init(hexString: "#EA2913"), for: .selected)
            btn.setImage(UIImage.init(named: selectImage[index]), for: .selected)
            
            
            self.addSubview(btn)
            btn.frame = CGRect(x: CGFloat(index) * kScreenW/5 , y: 5, width: kScreenW/5, height: CGFloat(kTabbarHeight - kSafeBottomHeight))
            btn.imagePosition(at: .top, space: 3)
            btn.tag = index
            btn.addTarget(self, action: #selector(click(sender:)), for: .touchUpInside)
            if index == 0 {
                btn.isSelected = true
                selectedBtn = btn
                backgroudImageView.isHidden = false
                selectBackgorundImageV = backgroudImageView
            }
            buttons.append(btn)
        }
    }
    @objc func click(sender:UIButton){
        let tag = sender.tag + 10000
        let imageV = self.viewWithTag(tag)

        if sender != selectedBtn{
            selectedBtn.isSelected = false
            selectedBtn = sender
            selectBackgorundImageV?.isHidden = true
            selectBackgorundImageV = imageV as? UIImageView
        }
        selectBackgorundImageV?.isHidden = false
        selectedBtn.isSelected = true
        
        delegate?.TabbarViewDidSelect(index: sender.tag)
    }
}
