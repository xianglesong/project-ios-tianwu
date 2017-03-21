//
//  UISetsViewController.swift
//  tianwu
//
//  Created by Rollin on 16/1/18.
//  Copyright © 2016年 jiuyaotianwu. All rights reserved.
//

import Foundation

//
//  AboutViewController.swift
//  tianwu
//
//  Created by Rollin on 16/1/16.
//  Copyright © 2016年 jiuyaotianwu. All rights reserved.
//

import Foundation
import UIKit

class UISetsViewController: UIViewController {
    
    private var texts = ["添物","", "接受推送消息"]
    private var images = ["logo", "", "sets"];
    private var switchBtn: UISwitch = UISwitch(frame: CGRect(x: 200, y: 10, width: 80, height: 20))
    
    override func viewDidLoad() {
        NSLog("UISetsViewController view controller")
        super.viewDidLoad()
        
        let r:CGRect = UIScreen.mainScreen().bounds
        let width = r.size.width
        NSLog("width:\(width)")
        
        let height = self.navigationController?.navigationBar.frame.size.height
        NSLog("height:\(height)")
        
        
        let view2 = UIView(frame: CGRectMake(0, height! + 50, width, 500))
        // view.backgroundColor = UIColor.yellowColor()
        view2.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
        self.view.addSubview(view2)
        
        let tableView = UITableView(frame: CGRect(x: 0, y: height! + 50, width: UIScreen.mainScreen().bounds.size.width, height: 500))
        // let tableView  = UITableView(frame: CGRectZero, style: UITableViewStyle.Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.scrollEnabled = false
        tableView.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
        tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0)
        tableView.tableFooterView = UIView()
        // tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        self.view.addSubview(tableView)
        
        // should be bottom get screen width and height
        // constraints set
        // should be 450
        let cp = UILabel(frame: CGRectMake(0, height! + 530, UIScreen.mainScreen().bounds.size.width, 30))
        cp.textAlignment = NSTextAlignment.Center;
        // cp.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
        cp.text = "添物科技 版权所有"
        cp.textAlignment = NSTextAlignment.Center
        self.view.addSubview(cp)
        
        self.view.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
        
        NSLog("about view end")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    func  myHandler(myParameter: (() -> Void)) {
    //        //code here
    //    }
    
}

extension UISetsViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if(indexPath.row == 2) {
            
            //            self.navigationController?.pushViewController(UIInspectViewController(nibName:"UIInspectViewController",bundle: nil), animated: true)
        }
        
    }
    
}

extension UISetsViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIndenttifier:String = "aboutCellIndenttifier";
        
        let cell:UITableViewCell  =  UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIndenttifier);
        
        if(indexPath.row == 0) {
            //cell.textLabel?.text = self.texts[indexPath.row]
            
            // let image = UIImage(named:"scan_barcode")
            //let image = UIImage(named: self.images[indexPath.row])
            //cell.imageView?.image = image;
            
            // cell.imageView!.layer.masksToBounds = true;
            //            cell.imageView!.layer.cornerRadius = 5;
            //            cell.imageView!.layer.borderWidth = 2;
            // cell.imageView!.layer.borderColor = UIColor.yellowColor().CGColor;
            //            cell.imageView!.layer.borderColor = ColorUitl.colorConvert("#FFFFFF").CGColor
            // cell.backgroundColor = ColorUitl.colorConvert("#FFFFFF")
            // cell.detailTextLabel?.text =  "版本号：" + AppInfo.getSoftwareVersion()
            // cell.detailTextLabel?.textColor = ColorUitl.colorConvert("#E1E1E1")
            // cell.accessoryType = UITableViewCellAccessoryType.None
            cell.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
        } else if(indexPath.row == 1 || indexPath.row == 3 ) {
            cell.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
            cell.accessoryType = UITableViewCellAccessoryType.None
        } else {
            // 添加图形
            // let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
            cell.textLabel?.text = self.texts[indexPath.row]
            
            // let image = UIImage(named:"scan_barcode")
            let image = UIImage(named: self.images[indexPath.row])
            cell.imageView?.image = image;
            
            cell.imageView!.layer.masksToBounds = true;
            //            cell.imageView!.layer.cornerRadius = 5;
            //            cell.imageView!.layer.borderWidth = 2;
            // cell.imageView!.layer.borderColor = UIColor.yellowColor().CGColor;
            //            cell.imageView!.layer.borderColor = ColorUitl.colorConvert("#FFFFFF").CGColor
            cell.backgroundColor = ColorUitl.colorConvert("#FFFFFF")
            //            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell.accessoryType = UITableViewCellAccessoryType.None
            
            //            let button = UIButton(frame: CGRect(x: 200, y: 10, width: 80, height: 20))
            //            button.backgroundColor = UIColor.yellowColor()
            //            button.setTitle("Mybutton", forState: UIControlState.Normal)
            ////            cell!.addSubview(button)
            //            cell.addSubview(button)
            
            switchBtn = UISwitch(frame: CGRect(x: UIScreen.mainScreen().bounds.size.width - 80, y: 5, width: 100, height: 20))
            switchBtn.addTarget(self, action: Selector("switchIsChanged:"), forControlEvents: UIControlEvents.ValueChanged)
            //            switchBtn.tintColor = ColorUitl.colorConvert("#FF0000")
            //            switchBtn.backgroundColor = ColorUitl.colorConvert("#00FF00")
            //            switchBtn.thumbTintColor = ColorUitl.colorConvert("#0000FF")
            cell.addSubview(switchBtn)
            
            
            // 可以看到MyButton
        }
        return cell
    }
    
    func switchIsChanged(mySwitch: UISwitch) {
        if mySwitch.on {
            NSLog("UISwitch is ON")
        } else {
            NSLog("UISwitch is OFF")
        }
    }
    
    func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            if(indexPath.section == 0  && indexPath.row == 0) {
                NSLog("table height \(indexPath.row)")
                return CGFloat(120)
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
            }
            return CGFloat(40)
    }
}