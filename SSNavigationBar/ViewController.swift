//
//  ViewController.swift
//  navigationTest
//
//  Created by 微博@iOS攻城犭师 on 16/1/18.
//  Copyright © 2016年 com.huiyun360.ssloadURLImage. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationController!.navigationBar.SS_setBarBackgroundColor(UIColor.clearColor())

        //复位
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem(title: "复位", style: .Done, target: self.navigationController!.navigationBar, action: "SS_reset"), animated: true)
        self.navigationItem.rightBarButtonItem!.tintColor = UIColor.whiteColor()
        
        
        //title view
        let view : UIView = NSBundle.mainBundle().loadNibNamed("MainContentTitleView", owner: self, options: nil).first as! UIView
        self.navigationItem.titleView = view
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 100
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let value = tool.intervalProportion(206, end: 250, now: scrollView.contentOffset.y) * 44
        
        //设置偏移
//        self.navigationController!.navigationBar.setContentY(-20 - value)
        self.navigationController!.navigationBar.SS_setBarHeight(44 - value)
        //titleView偏移
        self.navigationItem.titleView?.bounds = CGRect(x: 0, y: value, width: 100, height: 20)
        //左右按钮位置偏移
        self.navigationController!.navigationBar.SS_setButtonItemElementsContentY(value)
        
        //titleView透明度
        self.navigationItem.titleView?.alpha = 1 - tool.intervalProportion(206, end: 250, now: scrollView.contentOffset.y)
        //左右按钮透明度
        self.navigationController!.navigationBar.SS_setButtonItemElementsAlpha(1 - tool.intervalProportion(206, end: 250, now: scrollView.contentOffset.y))
        
        
        let offsetY = scrollView.contentOffset.y / 200
        self.navigationController!.navigationBar.SS_setBarBackgroundColor(UIColor.orangeColor().colorWithAlphaComponent(offsetY))
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view : UIView = UIView(frame: self.navigationController!.navigationBar.bounds)
        
        let color : UIColor = UIColor(red: (CGFloat)((Double)(arc4random() % 255) / 255.0), green: (CGFloat)((Double)(arc4random() % 255) / 255.0), blue: (CGFloat)((Double)(arc4random() % 255) / 255.0), alpha: 1)
        
        view.backgroundColor = color
        
        return view
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0){
            return 0
        }else{
            return 44
        }
    }

}

