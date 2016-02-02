//
//  SecondTableViewController.swift
//  SSNavigationBar
//
//  Created by 微博@iOS攻城犭师 on 16/2/2.
//  Copyright © 2016年 github.com/SSshare. All rights reserved.
//

import UIKit

class SecondTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "左按钮", style: .Done, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem!.tintColor = UIColor.whiteColor()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "reset", style: .Done, target: self.navigationController!.navigationBar, action: "SS_reset")
        self.navigationItem.rightBarButtonItem!.tintColor = UIColor.whiteColor()
        
        self.navigationController!.navigationBar.SS_setBarBackgroundColor(UIColor.orangeColor())
        self.navigationController!.navigationBar.SS_setBarHeight(64)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 10
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.contentView.backgroundColor = UIColor.groupTableViewBackgroundColor()

        return cell
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        //bar 高度
        let height = Tool.SS_NowBetweenAB(0, B: 44, NOW: contentOffsetY)
        self.navigationController!.navigationBar.SS_setBarHeight(64 - height * 44)
        //按钮位置
        self.navigationController!.navigationBar.SS_setButtonItemElementsContentY(height * 44)
        self.navigationController!.navigationBar.SS_setButtonItemElementsAlpha(1 - height)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
