//
//  Tool.swift
//  zhihuDaily
//
//  Created by 微博@iOS攻城犭师 on 16/1/25.
//  Copyright © 2016年 com.huiyun360. All rights reserved.
//

import UIKit

class Tool: NSObject {
    ///给定起点A，结束点B，以及目前所在位置，求所在位置占全程的百分比
    class func SS_NowBetweenAB (A: CGFloat, B: CGFloat, NOW: CGFloat) -> CGFloat {
        return NOW < A ? 0 : (NOW > B ? 1 : ((NOW/1.0 - A/1.0) / (B/1.0 - A/1.0)))
    }
    
    class func SS_RGB (R: CGFloat, G: CGFloat, B: CGFloat) -> UIColor {
        return UIColor(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: 1)
    }
    
    class func SS_RGBA (R: CGFloat, G: CGFloat, B: CGFloat, A: CGFloat) -> UIColor {
        return UIColor(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: A)
    }
    
    /**
     转换日期格式，根据年月日字符串（20160121），返回“1月21日 星期四”样式的字符串
     
     - parameter date: 例如：20080808
     
     - returns: x月x日 星期x
     */
    class func SS_transDateString (date: String) ->String {
        var year  = Int(NSString(string: date).substringWithRange(NSMakeRange(0, 4)))!
        var month = Int(NSString(string: date).substringWithRange(NSMakeRange(4, 2)))!
        let day   = Int(NSString(string: date).substringWithRange(NSMakeRange(6, 2)))!
        let monthString : String = "\(month)月"
        let dayString : String = "\(day)日 "
        //计算星期
        if(month == 1 || month == 2) {
            month += 12
            year--
        }
        let week : Int = (day + 2 * month + 3 * (month + 1) / 5 + year + year / 4 - year / 100 + year / 400) % 7
        var weekString : String = ""
        switch(week){
        case 0: weekString = "星期一" ; break
        case 1: weekString = "星期二" ; break
        case 2: weekString = "星期三" ; break
        case 3: weekString = "星期四" ; break
        case 4: weekString = "星期五" ; break
        case 5: weekString = "星期六" ; break
        case 6: weekString = "星期日" ; break
        default:break
        }
        return monthString + dayString + weekString
    }
    
    /**
     根据当前日期的字符串，计算前一天的日期，返回日期字符串格式
     
     - parameter date: 字符串格式的日期( 20160121 )
     
     - returns: 字符串格式的日期( 20160120 )
     */
    class func SS_getLastDayString (date: String) ->String {
        //日期格式
        let formatter = NSDateFormatter()
        // 20080808 格式
        formatter.dateFormat = "yyyyMMdd"
        //中国时区
        formatter.locale = NSLocale(localeIdentifier: "zh_CN")
        //将字符串转换成NSDate
        let dateNow = formatter.dateFromString(date)
        //计算前一天日期
        let lastDate = NSDate(timeInterval: -3600 * 24, sinceDate: dateNow!)
        //返回字符串格式的日期
        return formatter.stringFromDate(lastDate)
    }
}
