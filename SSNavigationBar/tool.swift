//
//  tool.swift
//  zhihuDaily
//
//  Created by 赵胜峰 on 16/1/12.
//  Copyright © 2016年 com.huiyun360. All rights reserved.
//

import UIKit

class tool: NSObject {
    /**
     根据给出的开始(begin)、结束(end)，计算现在(now)的值占区间的百分比(0~1)
     
     - parameter begin: 开始值(CGFloat)
     - parameter end:   结束值(CGFloat)
     - parameter now:   现在值(CGFloat)
     
     - returns: 现在的值占区间的百分比(CGFloat)
     */
    static func intervalProportion (begin : CGFloat , end : CGFloat , now : CGFloat) -> CGFloat {
        if(now <= begin){
            return 0
        }else if(now >= end){
            return 1
        }else{
            return (now - begin) / (end - begin)
        }
    }
    
    

}
