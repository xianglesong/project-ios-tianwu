//
//  IndexViewController.swift
//  tianwu
//
//  Created by Rollin on 16/1/8.
//  Copyright © 2016年 jiuyaotianwu. All rights reserved.
//

import Foundation
import UIKit

class IndexViewController: UITabBarController {
    
    @IBOutlet weak var indexTabbar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSLog("tianwu startup")
        let titleList : [String] = ["添物", "搜索", "我"]
        // set UITabBar
        
        // self.indexTabbar.backgroundColor = UIColor.blackColor()
        
        // self.indexTabbar.barTintColor = UIColor.blackColor()
        for (index, viewController) in self.viewControllers!.enumerate() {
            // 声明 TabBarItem 的Image，如果没有imageWithRenderingMode方法Image只会保留轮廓
            let image = UIImage(named: "TabBar\(index)")?.imageWithRenderingMode(.AlwaysOriginal)
            let selectedImage = UIImage(named: "TabBar\(index)Sel")?.imageWithRenderingMode(.AlwaysOriginal)
 
            // 声明新的无标题TabBarItem
            let tabBarItem = UITabBarItem(title: titleList[index], image: image, selectedImage: selectedImage)
           
            // 设置 tabBarItem 的 imageInsets 可以使图标居中显示
            // tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
            
            viewController.tabBarItem = tabBarItem
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}