//
//  AppInfo.swift
//  tianwu
//
//  Created by Rollin on 16/1/15.
//  Copyright © 2016年 jiuyaotianwu. All rights reserved.
//

import Foundation

class AppInfo {

    static func getSysVersion() -> String {
        let version = UIDevice.currentDevice().systemVersion
        return version;
    }
    
    static func getSoftwareVersion() ->  String {
        if let version = NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "Version Number Not Available"
    }
    
}

extension NSBundle {
    
    class var applicationVersionNumber: String {
        if let version = NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "Version Number Not Available"
    }
    
    class var applicationBuildNumber: String {
        if let build = NSBundle.mainBundle().infoDictionary?["CFBundleVersion"] as? String {
            return build
        }
        return "Build Number Not Available"
    }
    
}