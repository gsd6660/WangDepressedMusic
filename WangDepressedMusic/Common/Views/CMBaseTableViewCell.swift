//
//  CMBaseTableViewCell.swift
//  WangDepressedMusic
//
//  Created by guxiang on 2021/7/5.
//

import UIKit

class CMBaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        theme_backgroundColor = ThemeList.mainBackgroundColor

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        theme_backgroundColor = ThemeList.mainBackgroundColor
        initSubViews()
    }
    
    public func initSubViews(){
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
