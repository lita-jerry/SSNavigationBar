//
//
//  SSNavigationBar
//
//  Created by 微博@iOS攻城犭师
//
//  对navigation Bar 进行的扩展，可以实现修改背景色、bar高度、左右button item的透明度、Y轴偏移
//

import Foundation
import UIKit

private var BACK_VIEW = 0

extension UINavigationBar
{
    private var SS_backView: UIView {
        get{
            var view : UIView? = objc_getAssociatedObject(self, &BACK_VIEW) as? UIView
            if(view == nil){
                self.setBackgroundImage(UIImage(), forBarMetrics: .Default)
                self.shadowImage = UIImage()
                
                view = UIView(frame: CGRect(x: 0, y: -20, width: UIScreen.mainScreen().bounds.width, height: CGRectGetHeight(self.bounds) + 20))
                
                view!.userInteractionEnabled = false
                
                //如果做屏幕旋转，请自行优化
                view!.autoresizingMask = [.FlexibleWidth , .FlexibleHeight]
                
                self.insertSubview(view!, atIndex: 0)
            }
            self.SS_backView = view!
            return view!
            
        }
        set{
            objc_setAssociatedObject(self, &BACK_VIEW, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
    /**
     设置 navigationBar的背景色，可使用 UIColor的colorWithAlphaComponent(x) 方法改变透明度
     
     - parameter color: UIColor
     */
    func SS_setBarBackgroundColor (color : UIColor) {
        self.SS_backView.backgroundColor = color
    }
    
    
    
    /**
     设置 navigation Bar 的高度
     
     - parameter value: height value
     */
    func SS_setBarHeight (value : CGFloat) {
        var viewBounds = self.SS_backView.frame
        viewBounds.origin.y = -20 + value - 64
        self.SS_backView.frame = viewBounds
    }
    
    
    /**
     设置navigation的左、右按钮透明度
     
     - parameter alphaValue: alpha value
     */
    func SS_setButtonItemElementsAlpha (alphaValue : CGFloat) {
        
        self.valueForKey("_leftViews")?.enumerateObjectsUsingBlock({ (view, _, _) -> Void in
            (view as! UIView).alpha = alphaValue
        })
        
        self.valueForKey("_rightViews")?.enumerateObjectsUsingBlock({ (view, _, _) -> Void in
            (view as! UIView).alpha = alphaValue
        })
        
        //取消注释可以改变titleView的透明度
        /*
        let titleView = self.valueForKey("_titleView") as! UIView
        titleView.alpha = alphaValue
        */
    }
    
    
    /**
     设置 navigationBar上面左、右按钮的Y轴偏移
     
     - parameter contentY: contentY value
     */
    func SS_setButtonItemElementsContentY (contentY : CGFloat) {
        
        self.valueForKey("_leftViews")?.enumerateObjectsUsingBlock({ (view, _, _) -> Void in
            let leftView = view as! UIView
            var bounds = leftView.bounds
            bounds.origin.y = contentY
            leftView.bounds = bounds
        })
        
        self.valueForKey("_rightViews")?.enumerateObjectsUsingBlock({ (view, _, _) -> Void in
            let rightView = view as! UIView
            var bounds = view.bounds
            bounds.origin.y = contentY
            rightView.bounds = bounds
        })
        
        //取消注释可以改变titleView的bounds
        /*
        let titleView = self.valueForKey("_titleView") as! UIView
        var titleViewBounds = titleView.bounds
        titleViewBounds.origin.y = contentY
        titleView.bounds = titleViewBounds
        */
    }
    
    
    /**
     复位
     */
    func SS_reset () {
        self.setBackgroundImage(nil, forBarMetrics: .Default)
        self.SS_backView.removeFromSuperview()
    }
    
}