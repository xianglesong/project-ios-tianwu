//
//  AboutViewController.swift
//  tianwu
//
//  Created by Rollin on 16/1/16.
//  Copyright © 2016年 jiuyaotianwu. All rights reserved.
//

import Foundation
import UIKit

class AboutViewController: UIViewController {
    
    private var texts = ["","", "调查","", "反馈","", "商务合作"]
    private var images = ["logo", "", "inspect","","comment", "","business"];
    
    override func viewDidLoad() {
        NSLog("about view controller")
        super.viewDidLoad()
        
        
        let r:CGRect = UIScreen.mainScreen().bounds
        let width = r.size.width
        NSLog("width:\(width)")
        
        let height = self.navigationController?.navigationBar.frame.size.height
        NSLog("height:\(height)")
        
        
        let view2 = UIView(frame: CGRectMake(0, height! + 50, width, 500))
        
        view2.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
        self.view.addSubview(view2)
        
        let tableView = UITableView(frame: CGRect(x: 0, y: height! + 50, width: UIScreen.mainScreen().bounds.size.width, height: 500))
        // let tableView  = UITableView(frame: CGRectZero, style: UITableViewStyle.Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.scrollEnabled = false
        tableView.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
        
        tableView.tableFooterView = UIView()
        
        self.view.addSubview(tableView)
        
        // should be bottom get screen width and height
        // constraints set
        // should be 450
        let cp = UILabel(frame: CGRectMake(0, height! + 530, UIScreen.mainScreen().bounds.size.width, 30))
        cp.textAlignment = NSTextAlignment.Center;
        // cp.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
        cp.text = "添物科技 " +   "版本: " + AppInfo.getSoftwareVersion()
        cp.textAlignment = NSTextAlignment.Center
        self.view.addSubview(cp)
        
        self.view.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
        
        NSLog("about view end")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

extension AboutViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if(indexPath.row == 2) {
            self.navigationController?.pushViewController(UIInspectViewController(nibName:"UIInspectViewController",bundle: nil), animated: true)
        } else if(indexPath.row == 4) {
            self.navigationController?.pushViewController(UIFeedbackViewController(nibName:"UIFeedbackViewController",bundle: nil), animated: true)
        } else if(indexPath.row == 6) {
            self.navigationController?.pushViewController(UIBussinessViewController(nibName:"UIBussinessViewController",bundle: nil), animated: true)
        }
        
    }
    
    
}
extension AboutViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 7
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIndenttifier:String = "aboutCellIndenttifier";
        
        let cell:UITableViewCell  =  UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIndenttifier);
        
        if(indexPath.row == 0) {
            // cell.textLabel?.text = self.texts[indexPath.row]
            
            // let image = UIImage(named:"scan_barcode")
            // let image = UIImage(named: self.images[indexPath.row])
            // cell.imageView?.image = image;
            
            cell.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
            // cell.textLabel?.text =  "版本 " + AppInfo.getSoftwareVersion()
            // cell.detailTextLabel?.textColor = ColorUitl.colorConvert("#E1E1E1")
            // cell.accessoryType = UITableViewCellAccessoryType.None
        } else if(indexPath.row == 1 || indexPath.row == 3 || indexPath.row == 5) {
            cell.backgroundColor = ColorUitl.colorConvert("#E1E1E1")
            cell.accessoryType = UITableViewCellAccessoryType.None
        } else {
            // 添加图形
            // let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
            cell.textLabel?.text = self.texts[indexPath.row]
            
            // let image = UIImage(named:"scan_barcode")
            let image = UIImage(named: self.images[indexPath.row])
            cell.imageView?.image = image;
            
            cell.backgroundColor = ColorUitl.colorConvert("#FFFFFF")
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        return cell
    }
    
    
    func tableView(tableView: UITableView,
                   heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.section == 0  && indexPath.row == 0) {
            NSLog("table height \(indexPath.row)")
            return CGFloat(40)
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