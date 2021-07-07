//
//  UIEdgeInsetLabel.swift
//  LXSH
//
//  Created by guxiang on 2021/6/4.
//

import UIKit

extension UIEdgeInsets{
    func apply(_ rect: CGRect) -> CGRect {
        return rect.inset(by: self)
    }
}

class UIEdgeInsetLabel: UILabel {

    var textInsets = UIEdgeInsets.zero{
        didSet{
            invalidateIntrinsicContentSize()
        }
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textInsets)
        let textRect =  super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top, left: -textInsets.left, bottom: -textInsets.bottom, right: -textInsets.right)
        return textRect.inset(by: invertedInsets)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}
