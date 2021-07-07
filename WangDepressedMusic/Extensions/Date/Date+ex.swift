//
//  Date+ex.swift
//  LXSH
//
//  Created by guxiang on 2021/6/4.
//

import Foundation

extension String{
    func timeString(timeString:String) -> String {
        let timeInterval = TimeInterval(timeString)!
        let  date = Date(timeIntervalSince1970: timeInterval)
        let newDate = Date()
        let secondsInterVal : Double = newDate.timeIntervalSince(date)
               
        var temp:Double = 0
        var result:String = ""
        if secondsInterVal/60 < 1 {
            result = "刚刚更新"
        }else if (secondsInterVal/60)<60{
            temp = secondsInterVal / 60
            result = "更新于\(Int(temp))分钟前"
        }else if secondsInterVal / 60 * 60 < 24 * 60{
            temp = secondsInterVal / 60
            result = "更新于\(Int(temp))小时前"
        }else if secondsInterVal / (24 * 60 * 60) < 30 * 24 * 60{
            temp = secondsInterVal / (24 * 60 * 60)
            if temp < 30 {
                result = "更新于\(Int(temp))天前"
            }else{
                temp = temp / 30
                result = "更新于\(Int(temp))月前"
            }
        }
        return result
    }
}
