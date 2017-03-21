//
//  ShopViewController.swift
//  tianwu
//
//  Created by Rollin on 16/1/16.
//  Copyright © 2016年 jiuyaotianwu. All rights reserved.
//

import Foundation
import UIKit

class ShopViewController: UIViewController {
    
    @IBOutlet weak var shopWevView: UIWebView!
    
    override func viewDidLoad() {
        NSLog("shop view controller")
        super.viewDidLoad()
        
        //  let url = NSURL(string: "http://91tianwu.taobao.com/");
        //  let request = NSURLRequest(URL:url!);
        //
        //  shopWevView.loadRequest(request);
        var height = self.navigationController?.navigationBar.frame.size.height
        NSLog("height:\(height)")
        height = height! + 20
        NSLog("height2:\(height)")
        let myWebView:UIWebView = UIWebView(frame: CGRectMake(0, height!, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        myWebView.loadRequest(NSURLRequest(URL: NSURL(string: "http://91tianwu.taobao.com/")!))
        self.view.addSubview(myWebView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}