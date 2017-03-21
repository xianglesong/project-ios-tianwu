//
//  ProfileViewController.swift
//  tianwu
//
//  Created by Rollin on 16/1/8.
//  Copyright © 2016年 jiuyaotianwu. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UITableViewController {
    
    @IBOutlet weak var profileNavItemView: UINavigationItem!
    
    var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view, typically from a nib.
        NSLog("profile view startup")
        
        let view = UIView(frame: CGRectMake(0, 0, 200, 20))
        //        view.backgroundColor = UIColor.yellowColor()
        let uiLable = UILabel(frame: CGRectMake(0, 0, 200, 20))
        uiLable.textAlignment = NSTextAlignment.Center;
        uiLable.text = "我"
        // uiLable.backgroundColor = UIColor.blueColor()
        
        view.addSubview(uiLable)
        
        // self.navigationController?.navigationItem.rightBarButtonItem.;
        // self.navigationController?.navigationBar.addSubview(view)
        
        self.navigationItem.titleView = view
        self.navigationController?.title = "我"
        self.view.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
        
        // others set
        // self.view.backgroundColor = UIColor.grayColor()
        // profileTableView.backgroundColor = UIColor.blueColor()
        // let colorUitl = ColorUitl()
        
        
        profileTableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Grouped)
        profileTableView.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
        profileTableView.tableFooterView = UIView()
        
        //         profileTableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0)
        //         profileTableView.separatorInset = UIEdgeInsetsZero
        profileTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        //        profileTableView.separatorColor = ColorUitl.colorConvert("#FFFF00")
        // 设置端距，这里表示separator离左边和右边均80像素
        
        profileTableView.dataSource = self
        profileTableView.delegate = self
        tableView.tableFooterView = UIView()
        //        if(profileTableView.respondsToSelector(Selector("setLayoutMargins:"))){
        //            profileTableView.layoutMargins = UIEdgeInsetsZero;
        //        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cellIndenttifier:String = "CellIndenttifier";
        
        let cell:UITableViewCell  =  UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIndenttifier);
        if(indexPath.section == 0 && indexPath.row == 0) {
            cell.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
            cell.accessoryType = UITableViewCellAccessoryType.None
        } else  if (indexPath.section == 0 && indexPath.row == 1) {
            // cell.textLabel!.text = "添物";
            // 圆角
            // cell.imageView!.image = UIImage(named:"logo");
            
            // cell.imageView!.layer.masksToBounds = true;
            //            cell.imageView!.layer.cornerRadius = 5;
            //            cell.imageView!.layer.borderWidth = 2;
            //            // cell.imageView!.layer.borderColor = UIColor.yellowColor().CGColor;
            //            cell.imageView!.layer.borderColor = ColorUitl.colorConvert("#FFFFFF").CGColor
            // cell.backgroundColor = ColorUitl.colorConvert("#FFFFFF")
            // cell.accessoryType = UITableViewCellAccessoryType.None
            cell.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
            // cell.textLabel?.text =  "版本 " + AppInfo.getSoftwareVersion()
            // cell.detailTextLabel?.textColor = ColorUitl.colorConvert("#E1E1E1")
            // cell.accessoryType = UITableViewCellAccessoryType.None
            
            //            profileTableView.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
            //            profileTableView.separatorColor = ColorUitl.colorConvert("#FF0000")
            //            profileTableView.separatorInset = UIEdgeInsetsMake(0,20, 0, 20)
            //            // 设置端距，这里表示separator离左边和右边均80像素
            //            profileTableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
            
            //            cell.separatorInset = UIEdgeInsetsMake(0,20, 0, 20)
            
        } else if(indexPath.section == 0 && indexPath.row == 2) {
            cell.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
            cell.accessoryType = UITableViewCellAccessoryType.None
        } else if(indexPath.section == 0 && indexPath.row == 3) {
            cell.textLabel!.text = "商城";
            // 圆角
            cell.imageView!.image = UIImage(named:"shopping");
            cell.imageView!.layer.masksToBounds = true;
            //            cell.imageView!.layer.cornerRadius = 5;
            //            cell.imageView!.layer.borderWidth = 2;
            //            // cell.imageView!.layer.borderColor = UIColor.yellowColor().CGColor;
            //            cell.imageView!.layer.borderColor = ColorUitl.colorConvert("#FFFFFF").CGColor
            cell.backgroundColor = ColorUitl.colorConvert("#FFFFFF")
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            // add split line
            
        } else if(indexPath.section == 0 && indexPath.row == 4) {
            cell.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
            cell.accessoryType = UITableViewCellAccessoryType.None
        } else if(indexPath.section == 0 && indexPath.row == 5) {
            cell.textLabel!.text = "微店";
            // 圆角
            cell.imageView!.image = UIImage(named:"shopping");
            cell.imageView!.layer.masksToBounds = true;
         
            cell.backgroundColor = ColorUitl.colorConvert("#FFFFFF")
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }else if(indexPath.section == 0 && indexPath.row == 6) {
            cell.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
            cell.accessoryType = UITableViewCellAccessoryType.None
        } else if(indexPath.section == 0 && indexPath.row == 7) {
            cell.textLabel!.text = "关于";
            // 圆角
            cell.imageView!.image = UIImage(named:"about");
            cell.imageView!.layer.masksToBounds = true;
            //            cell.imageView!.layer.cornerRadius = 5;
            //            cell.imageView!.layer.borderWidth = 2;
            //            cell.imageView!.layer.borderColor = ColorUitl.colorConvert("#FFFFFF").CGColor
            cell.backgroundColor = ColorUitl.colorConvert("#FFFFFF")
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        } else if(indexPath.section == 0 && indexPath.row == 8) {
            cell.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
            cell.accessoryType = UITableViewCellAccessoryType.None
        } else if(indexPath.section == 0 && indexPath.row == 9) {
            cell.textLabel!.text = "设置";
            //圆角
            cell.imageView!.image = UIImage(named:"sets");
            cell.imageView!.layer.masksToBounds = true;
   
            cell.backgroundColor = ColorUitl.colorConvert("#FFFFFF")
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell.selectionStyle =  UITableViewCellSelectionStyle.Gray;
     
        } else  {
            cell.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        //  cell.detailTextLabel?.text  = "none";
        
        return cell;
    }
    
    override   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
 
        // 提示窗
        // let alertViewController:UIAlertController = UIAlertController(title:"提示", message:"x\(indexPath)", preferredStyle: UIAlertControllerStyle.Alert);
        //
        // let alertView = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil);
        //
        // alertViewController.addAction(alertView);
        // self.presentViewController(alertViewController, animated: true, completion: nil);
        
        //
        if(indexPath.section == 0 && indexPath.row == 7) {
            let myVC = (self.storyboard?.instantiateViewControllerWithIdentifier("SBAbout"))! as UIViewController
            //            self.presentViewController(thirdVC, animated: true, completion: nil);
            self.navigationController?.pushViewController(myVC, animated: true)
        } else if(indexPath.section == 0 && indexPath.row == 3) {
            let myVC = (self.storyboard?.instantiateViewControllerWithIdentifier("SBShopMall"))! as UIViewController
            self.navigationController?.pushViewController(myVC, animated: true)
        } else if(indexPath.section == 0 && indexPath.row == 5) {
            let myVC = (self.storyboard?.instantiateViewControllerWithIdentifier("SBShopWeididan"))! as UIViewController
            self.navigationController?.pushViewController(myVC, animated: true)
        } else if(indexPath.section == 0 && indexPath.row == 9) {
            let myVC = (self.storyboard?.instantiateViewControllerWithIdentifier("SBSets"))! as UIViewController
            self.navigationController?.pushViewController(myVC, animated: true)
        }
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    override func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            if(indexPath.section == 0  && indexPath.row == 0) {
                NSLog("table height \(indexPath.row)")
                return CGFloat(30)
            } else if(indexPath.section == 0  && indexPath.row == 1) {
                NSLog("table height \(indexPath.row)")
                return CGFloat(40)
            } else if(indexPath.section == 0  && indexPath.row == 2) {
                NSLog("table height \(indexPath.row)")
                return CGFloat(40)
            } else if(indexPath.section == 0  && indexPath.row == 3) {
                NSLog("table height \(indexPath.row)")
                return CGFloat(40)
            } else if(indexPath.section == 0  && indexPath.row == 4) {
                NSLog("table height \(indexPath.row)")
                return CGFloat(40)
            } else if(indexPath.section == 0  && indexPath.row == 5) {
                NSLog("table height \(indexPath.row)")
                return CGFloat(40)
            } else if(indexPath.section == 0  && indexPath.row == 6) {
                NSLog("table height \(indexPath.row)")
                return CGFloat(40)
            } else if(indexPath.section == 0  && indexPath.row == 7) {
                NSLog("table height \(indexPath.row)")
                return CGFloat(40)
            } else if(indexPath.section == 0  && indexPath.row == 8) {
                NSLog("table height \(indexPath.row)")
                return CGFloat(40)
            } else if(indexPath.section == 0  && indexPath.row == 9) {
                NSLog("table height \(indexPath.row)")
                return CGFloat(40)
            }
            return CGFloat(40)
    }
    
}