//
//  ColorUtil.swift
//  tianwu
//
//  Created by Rollin on 16/1/16.
//  Copyright © 2016年 jiuyaotianwu. All rights reserved.
//

import Foundation

class ColorUitl {
    static func colorConvert ( Color_Value:NSString)->UIColor{
        var  Str :NSString = Color_Value.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        if Color_Value.hasPrefix("#"){
            Str=(Color_Value as NSString).substringFromIndex(1)
        }
        let strRed = (Str as NSString ).substringToIndex(2)
        let strGreen = ((Str as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let strBlue = ((Str as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string:strRed).scanHexInt(&r)
        NSScanner(string:strGreen).scanHexInt(&g)
        NSScanner(string:strBlue).scanHexInt(&b)
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1)
    }
}