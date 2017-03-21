//
//  ShopWeidianController.swift
//  
//
//  Created by Rollin on 16/2/4.
//
//

import Foundation
import UIKit

class ShopWeidianController: UIViewController {
    
 
    @IBOutlet weak var shopWevView: UIWebView!
    
    override func viewDidLoad() {
        NSLog("shop view controller")
        super.viewDidLoad()
        
        //  let url = NSURL(string: "http://weidian.com/?userid=365794545“);
        //  let request = NSURLRequest(URL:url!);
        //
        //  shopWevView.loadRequest(request);
        var height = self.navigationController?.navigationBar.frame.size.height
        NSLog("height:\(height)")
        height = height! + 20
        NSLog("height2:\(height)")
        let myWebView:UIWebView = UIWebView(frame: CGRectMake(0, height!, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        myWebView.loadRequest(NSURLRequest(URL: NSURL(string: "http://weidian.com/?userid=365794545")!))
        self.view.addSubview(myWebView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}