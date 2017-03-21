//
//  UIInspectViewController.swift
//  tianwu
//
//  Created by Rollin on 16/1/18.
//  Copyright © 2016年 jiuyaotianwu. All rights reserved.
//

import UIKit

class UIInspectViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // self.navigationController?.title = "调查"
        // self.navigationItem.title = "调查"
        // self.title = "调查"
        // self.navigationController?.navigationBar.
        
        let url = NSURL(string: "http://form.mikecrm.com/f.php?t=VbD9hW");
        let request = NSURLRequest(URL:url!);
        
        myWebView.loadRequest(request);
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
