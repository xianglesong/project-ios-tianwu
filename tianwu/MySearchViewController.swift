//
//  MySearchViewController.swift
//  tianwu
//
//  Created by Rollin on 16/1/28.
//  Copyright © 2016年 jiuyaotianwu. All rights reserved.
//

import UIKit

class MySearchViewController: UIViewController {
    @IBOutlet weak var mySearchWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
        
        // self.navigationController?.title = "搜索"
        // let url = NSURL(string: "http://form.mikecrm.com/f.php?t=VbD9hW");
        // let request = NSURLRequest(URL:url!);
        
        
        let query:String = ((UIApplication.sharedApplication().delegate) as! AppDelegate).getSearh()
      
        
        let searchQuery = "http://search.91tianwu.com/searchm?qparam=" + query
        let searchUrl = NSURL(string: searchQuery.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        // var url:NSURL!
        //url = NSURL(string:searchUrl)
        let request = NSURLRequest(URL:searchUrl!);
        
        mySearchWebView.loadRequest(request);
    
        NSLog("searchWebView startup " + query)
        
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
    
}
