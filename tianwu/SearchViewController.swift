//
//  SearchViewController.swift
//  tianwu
//
//  Created by Rollin on 16/1/8.
//  Copyright © 2016年 jiuyaotianwu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view, typically from a nib.
        NSLog("search view startup")
        
        let view = UIView(frame: CGRectMake(0, 0, 200, 20))
        // view.backgroundColor = UIColor.yellowColor()
        let uiLable = UILabel(frame: CGRectMake(0, 0, 200, 20))
        uiLable.textAlignment = NSTextAlignment.Center;
        uiLable.text = "搜索"
        // uiLable.backgroundColor = UIColor.blueColor()
        
        view.addSubview(uiLable)
        
        // self.navigationController?.navigationItem.rightBarButtonItem.;
        
        // self.navigationController?.navigationBar.addSubview(view)
        
        self.navigationItem.titleView = view
        
        self.navigationController?.title = "添搜"
        
        self.navigationController?.navigationBar.addSubview(view)
        
        let leftItem:UIBarButtonItem = UIBarButtonItem(title: "添搜", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("leftButtonClick"))
        
        self.navigationItem.leftBarButtonItem = leftItem
        
        let url = NSURL(string: "http://search.91tianwu.com/");
        let request = NSURLRequest(URL:url!);
        
        searchWebView.loadRequest(request);
        
        NSLog("searchWebView startup")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func leftButtonClick() {
        NSLog("web view go home")
        let url = NSURL(string: "http://search.91tianwu.com/");
        let request = NSURLRequest(URL:url!);
        
        searchWebView.loadRequest(request);
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
