//
//  zhihuDailyViewController.swift
//  SSNavigationBar
//
//  Created by 微博@iOS攻城犭师 on 16/2/2.
//  Copyright © 2016年 github.com/SSshare. All rights reserved.
//

import UIKit

class zhihuDailyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController!.navigationBar.SS_setBarBackgroundColor(Tool.SS_RGBA(1, G: 131, B: 209, A: 0))
        
        let titleView: UIView = NSBundle.mainBundle().loadNibNamed("MainContentTitleView", owner: self, options: nil).first as! UIView
        self.navigationItem.titleView = titleView
        
        let headerView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 300))
        headerView.image = UIImage(named: "xff")
        self.tableView.tableHeaderView = headerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 44))
        view.backgroundColor = Tool.SS_RGB(1, G: 131, B: 209)
        //        view.backgroundColor = Tool.SS_RGB(255, G: 131, B: 209)
        
        let label = UILabel(frame: view.bounds)
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.systemFontOfSize(17)
        label.textAlignment = .Center
        label.text = "2008年8月8日 星期八"
        
        view.addSubview(label)
        return view
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 44.0
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        return cell
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let contentoffsetY = scrollView.contentOffset.y
        //设置极限滚动
        if(contentoffsetY < -100){
            self.tableView.contentOffset.y = -100
        }
        
        //改变navigationBar 透明度
        self.navigationController!.navigationBar.SS_setBarBackgroundColor(Tool.SS_RGBA(1, G: 131, B: 209, A: Tool.SS_NowBetweenAB(0, B: 300 - 64, NOW: contentoffsetY)))
            
            //barView高度
            let begin = CGFloat(10 * 50 + 300 - 44)
            let end = begin + 44
            self.navigationController!.navigationBar.SS_setBarHeight(64 - Tool.SS_NowBetweenAB(begin, B: end, NOW: contentoffsetY) * 44)
            
            //改变NVBarView的Y轴偏移、透明度
            self.navigationItem.titleView!.bounds = CGRect(x: 0, y: (Tool.SS_NowBetweenAB(begin, B: end, NOW: contentoffsetY) * 44), width: 100, height: 20)
            self.navigationItem.titleView!.alpha = 1 - Tool.SS_NowBetweenAB(begin, B: end, NOW: contentoffsetY)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
