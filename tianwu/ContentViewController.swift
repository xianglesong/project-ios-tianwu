//
//  ContentViewController.swift
//  tianwu
//
//  Created by Rollin on 16/1/8.
//  Copyright © 2016年 jiuyaotianwu. All rights reserved.
//

import Foundation

import Foundation
import UIKit
import Popover


class ContentViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var myWebView: UIWebView!
    
    let sectionsTableIdentifier = "SectionsTableIndentifier"
    var searchBar : UISearchBar!
    
    private var texts = ["扫一扫", "分享"]
    private var images = ["scan_barcode","weixin_share_logo"];
    
    private var popover: Popover!
    private var popoverOptions: [PopoverOption] = [
        .Type(.Down),
        .BlackOverlayColor(UIColor(white: 0.0, alpha: 0.6))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSLog("content view startup")
        
        self.navigationController?.title = "添物"
        
        let view = UIView(frame: CGRectMake(0, 0, 250, 30))
        // view.backgroundColor = UIColor.yellowColor()
        
        self.navigationItem.titleView = view
        
        searchBar = UISearchBar(frame: CGRectMake(0, 0, 230, 30))
        searchBar.backgroundColor = UIColor.blueColor()
        searchBar.delegate = self;
        // searchBar.showsCancelButton = NO;
        // searchBar.barStyle=UIBarStyleDefault;
        
        for view in searchBar.subviews  {
            if view.isKindOfClass(NSClassFromString("UISearchBarBackground")!){
                view.removeFromSuperview()
                break;
            }
        }
        
        searchBar.placeholder = "添物搜索"
        view.addSubview(searchBar)
        
        self.navigationController?.navigationBar.addSubview(view)
        
        let leftItem:UIBarButtonItem = UIBarButtonItem(title: "添物", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("leftButtonClick"))
        
        self.navigationItem.leftBarButtonItem = leftItem
        
        let item = UIBarButtonItem(title: "＋", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("tappedRightBarButton"))
        self.navigationItem.rightBarButtonItem = item
        
        let url = NSURL(string: "http://www.91tianwu.com/");
        let request = NSURLRequest(URL:url!);
        
        myWebView.loadRequest(request);
        
        NSLog("web view startup")
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        NSLog("searchbar edit")
        // 跳转到下一个页面
        
        // SearchSuggest
        // performSegueWithIdentifier("SearchSuggest", sender:self)
        let searchViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("SearchSuggest"))! as UIViewController
        
        self.navigationController?.pushViewController(searchViewController, animated: true)
        
        return true
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        NSLog("search bar searchBarTextDidBeginEditing")
        let query = searchBar.self.text
        NSLog("search bar searchBarTextDidBeginEditing" + query!)
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        NSLog("search bar searchBarShouldEndEditing")
        let query = searchBar.self.text
        NSLog("search bar searchBarShouldEndEditing" + query!)
        return true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        NSLog("search bar did end edit")
        let query = searchBar.self.text
        NSLog("search bar clicked" + query!)
        //        let url = NSURL(string: "http://search.91tianwu.com/" + query!);
        //        let request = NSURLRequest(URL:url!);
        
        //        myWebView.loadRequest(request);
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        NSLog("search bar clicked")
        let query = searchBar.self.text
        NSLog("search bar clicked" + query!)
        //        let url = NSURL(string: "http://search.91tianwu.com/" + query!);
        //        let request = NSURLRequest(URL:url!);
        
        //        myWebView.loadRequest(request);
    }
    
    func leftButtonClick() {
        NSLog("web view go home")
        let url = NSURL(string: "http://www.91tianwu.com/");
        let request = NSURLRequest(URL:url!);
        
        myWebView.loadRequest(request);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        MobClick.beginLogPageView("HomePage")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        MobClick.endLogPageView("HomePage")
    }
    
    //    func searchDisplayControllerWillBeginSearch(controller: UISearchDisplayController) {
    //        self.searchDisplayController?.searchBar.showsCancelButton = true
    //
    //        var cancelButton: UIButton?
    //        var topView: UIView = controller.searchBar.subviews[0] as! UIView
    //        for view in topView.subviews  {
    //            if view.isKindOfClass(NSClassFromString("UINavigationButton")!){
    //                cancelButton =  view as? UIButton
    //            }
    //        }
    //        if (cancelButton != nil) {
    //            cancelButton?.setTitle("取消", forState: UIControlState.Normal)
    //            cancelButton?.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    //        }
    //
    //    }
    
    // 搜索代理UISearchBarDelegate方法，每次改变搜索内容时都会调用
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        NSLog("searhc xxxx" + searchBar.text!)
        if searchText == "" {
        } else {
        }
        // 没有搜索内容时显示全部组件
    }
    
    func tappedRightBarButton() {
        NSLog("tappedRightBarButton xxxx")
        let startPoint = CGPoint(x: 400, y: 65)
        //    let aView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 180))
        //    let popover = Popover()
        //    popover.show(aView, point: startPoint)
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.scrollEnabled = false
        self.popover = Popover(options: self.popoverOptions, showHandler: nil, dismissHandler: nil)
        // self.popover.show(tableView, fromView: self.rightButtomButton)
        
        popover.show(tableView, point: startPoint)
    }
    
}

extension ContentViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//                let alertController = UIAlertController(title: "系统提示",
//                    message: "您确定吗？\(indexPath)", preferredStyle: UIAlertControllerStyle.Alert)
//        
//                let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default,
//                    handler: {
//                        action in
//                        print("你选中了【\(indexPath)】")
//                    }
//                )
//        
//                alertController.addAction(okAction)
//                self.presentViewController(alertController, animated: true, completion:nil)
        
        self.popover.dismiss()
        if(indexPath.row == 0) {
            self.navigationController?.pushViewController(UIScanViewController(nibName:"UIScanViewController",bundle: nil), animated: true)
            NSLog("show scan")
        } else if(indexPath.row == 1) {
            // get mywebview 的地址
            
            let url = myWebView.request?.URL?.absoluteString
            NSLog("url address: " + url!)
            let htmlTitle = myWebView.stringByEvaluatingJavaScriptFromString("document.title");
            NSLog(htmlTitle!)
            
            // 分享到微信朋友圈
            let message =  WXMediaMessage()
            // 分享的标题
            message.title = "欢迎访问 www.91tianwu.com"
            message.title = htmlTitle;
            //            message.description = "专业导购网。"
//            message.setThumbImage(UIImage(named:"logo"))
            message.setThumbImage(UIImage(named:"tianwuapplogo"))
            
            let ext =  WXWebpageObject()
            ext.webpageUrl = "http://www.91tianwu.com"
            ext.webpageUrl = url
            message.mediaObject = ext
            
            let req =  SendMessageToWXReq()
            req.bText = false
            req.message = message
            // let _scene = WXSceneSession.rawValue
            req.scene = Int32(WXSceneTimeline.rawValue)
            
            WXApi.sendReq(req)
            
//             alertController.addAction(okAction)
//             self.presentViewController(alertController, animated: true, completion:nil)
            NSLog("weixin share")
        }
        
    }
    
}

extension ContentViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 添加图形
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        cell.textLabel?.text = self.texts[indexPath.row]
        
        // let image = UIImage(named:"scan_barcode")
        let image = UIImage(named: self.images[indexPath.row])
        cell.imageView?.image = image;
        return cell
    }
}

