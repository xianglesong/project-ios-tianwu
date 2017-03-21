//
//  UIScanViewController.swift
//  tianwu
//
//  Created by Rollin on 16/1/26.
//  Copyright © 2016年 jiuyaotianwu. All rights reserved.
//

import UIKit

import AVFoundation

class UIScanViewController: UIViewController {
    
    var session: AVCaptureSession?
    
    let scanSize = CGSize(width: 300.0, height: 300.0)
    let metaDataOutput = AVCaptureMetadataOutput()
    
    var contentW: CGFloat = 0.0
    var contentH: CGFloat = 0.0
    var query: String = ""
    
    
    var myWebView:UIWebView = UIWebView(frame: CGRectMake(0, 0, 0, 0));
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "二维码／条形码扫描"
        
        let screenSize = UIScreen.mainScreen().bounds.size
        contentW = screenSize.width
        contentH = screenSize.height
        
        setUpCamera()
        setUpQRMask()
        
        var height = self.navigationController?.navigationBar.frame.size.height
        NSLog("height:\(height)")
        height = height! + 20
        NSLog("height2:\(height)")
        myWebView = UIWebView(frame: CGRectMake(0, height!, UIScreen.mainScreen().bounds.width,   UIScreen.mainScreen().bounds.height));
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("avCaptureInputPortFormatDescriptionDidChangeNotification:"), name:AVCaptureInputPortFormatDescriptionDidChangeNotification, object: nil)
        
        let startTime = NSDate()
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) {
            let group = dispatch_group_create()
            dispatch_group_async(group, queue) {
                let endTime = NSDate()
                self.getScanResult("")
                NSLog("query " + self.query);
                print("Completed in \(endTime.timeIntervalSinceDate(startTime)) seconds")
            }
            
            dispatch_group_notify(group, queue) {
                if(self.query != "") {
                    dispatch_async(queue) {
                        // let startTime = NSDate()
                        NSLog("query " + self.query);
                        if (self.query.hasPrefix("http://")) {
                            self.myWebView.loadRequest(NSURLRequest(URL: NSURL(string: self.query)!))
                        } else if(self.query.hasPrefix("https://")) {
                            self.myWebView.loadRequest(NSURLRequest(URL: NSURL(string: self.query)!))
                        } else {
                            self.myWebView.loadRequest(NSURLRequest(URL: NSURL(string: "http://search.91tianwu.com/searchm?qparam="+self.query)!))
                        }
                        self.view.addSubview(self.myWebView)
                        NSLog("query " + self.query);
                        
                        // 跳转搜索结果
                        
                        // loading 加载图像
                    }
                }
            }
        }
        
        
        NSLog("query final" + self.query);
        
    }
    
    func getScanResult(data: String) -> String {
        //        var count = 10;
        //         && count-- > 0
        while(self.query == "") {
            //NSThread.sleepForTimeInterval(1)
        }
        return self.query
    }
    
    
    func avCaptureInputPortFormatDescriptionDidChangeNotification(notification: NSNotification) {
        metaDataOutput.rectOfInterest = CGRectMake(0, 0, 1, 1)
        //        metaDataOutput.rectOfInterest = CGRectMake(0, 0, 1, 1)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        session?.startRunning()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        session?.stopRunning()
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

// MARK: AVCaptureMetadataOutputObjectsDelegate

extension UIScanViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        var stringValue = ""
        NSLog("xx.{}")
        if metadataObjects.count > 0 {
            let metaDataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            
            if metaDataObject.type == AVMetadataObjectTypeQRCode {
                stringValue = metaDataObject.stringValue
                
                if stringValue.characters.count > 0 {
                    session?.stopRunning()
                    print("QRCode: \(stringValue)")
                    
                    query = stringValue;
                    // http则访问url地址
                    // webview 显示内容
                    //                    var height = self.navigationController?.navigationBar.frame.size.height
                    //                    NSLog("height:\(height)")
                    //                    height = height! + 20
                    //                    NSLog("height2:\(height)")
                    //                    let myWebView:UIWebView = UIWebView(frame: CGRectMake(0, height!, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
                    //                    myWebView.loadRequest(NSURLRequest(URL: NSURL(string: stringValue)!))
                    //                    self.view.addSubview(myWebView)
                    
                }
            } else if (metaDataObject.type == AVMetadataObjectTypeEAN13Code || metaDataObject.type == AVMetadataObjectTypeEAN8Code || metaDataObject.type == AVMetadataObjectTypeCode128Code) {
                stringValue = metaDataObject.stringValue
                
                if stringValue.characters.count > 0 {
                    session?.stopRunning()
                    print("BarCode: \(stringValue)")
                    query = stringValue;
                    // http则访问url地址
                    //                    var height = self.navigationController?.navigationBar.frame.size.height
                    //                    NSLog("height:\(height)")
                    //                    height = height! + 20
                    //                    NSLog("height2:\(height)")
                    //                    let myWebView:UIWebView = UIWebView(frame: CGRectMake(0, height!, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
                    //                    myWebView.loadRequest(NSURLRequest(URL: NSURL(string: "http://search.91tianwu.com/searchm?qparam="+stringValue)!))
                    //                    self.view.addSubview(myWebView)
                    
                }
                
            } else {
                stringValue = metaDataObject.stringValue
                
                if stringValue.characters.count > 0 {
                    session?.stopRunning()
                    print("BarCode: \(stringValue)")
                    // http则访问url地址
                }
            }
        }
        
    }
    
}

// MARK: Private Methods

extension UIScanViewController {
    
    func setUpCamera() {
        if checkCameraAvaliable() {
            if checkCameraAuthorise() {
                let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
                var input: AVCaptureDeviceInput;
                do {
                    input = try AVCaptureDeviceInput(device: device)
                } catch let error as NSError {
                    print("error:\(error.localizedDescription)")
                    return
                }
                
                session = AVCaptureSession()
                session!.sessionPreset = AVCaptureSessionPresetHigh
                if session!.canAddInput(input) {
                    session!.addInput(input)
                }
                
                //                let metaDataOutput = AVCaptureMetadataOutput()
                if session!.canAddOutput(metaDataOutput) {
                    session!.addOutput(metaDataOutput)
                }
                
                let dispatchQueue = dispatch_queue_create("com.xianglesong", nil)
                metaDataOutput.setMetadataObjectsDelegate(self, queue: dispatchQueue)
                metaDataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code ]
                
                // set scan rect
                var scanRect = CGRect(x: (contentW-scanSize.width)/2.0, y: (contentH-scanSize.height)/2.0, width: scanSize.width, height: scanSize.height)
                
                scanRect = CGRect(x: scanRect.origin.y/contentH, y: scanRect.origin.x/contentW, width: scanRect.size.height/contentH, height: scanRect.size.width/contentW)
                
                metaDataOutput.rectOfInterest = scanRect
                
                let previewLayer = AVCaptureVideoPreviewLayer(session: session)
                previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
                
                previewLayer.frame = view.bounds
                view.layer.insertSublayer(previewLayer, atIndex: 0)
            }
        } else {
            print("相机不可用")
        }
    }
    
    func setUpQRMask() {
        let centerRect = CGRect(x: (contentW-scanSize.width)/2.0, y: (contentH-scanSize.height)/2.0, width: scanSize.width, height: scanSize.height)
        
        let path = UIBezierPath(rect: view.bounds)
        let centerPath = UIBezierPath(rect: centerRect)
        path.appendPath(centerPath)
        path.usesEvenOddFillRule = true
        
        let fillLayer = CAShapeLayer()
        fillLayer.path = path.CGPath
        fillLayer.fillRule = kCAFillRuleEvenOdd
        fillLayer.fillColor = UIColor.blackColor().colorWithAlphaComponent(0.3).CGColor
        view.layer.addSublayer(fillLayer)
    }
    
    func checkCameraAvaliable() -> Bool {
        return UIImagePickerController.isSourceTypeAvailable(.Camera);
    }
    
    func checkCameraAuthorise() -> Bool {
        let status = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo)
        if status == .Restricted || status == .Denied {
            
            let alertActionController = UIAlertController(title: "", message: nil, preferredStyle: .Alert)
            
            let message: String
            
            switch UIDevice.currentDevice().systemVersion.compare("8.0.0", options: NSStringCompareOptions.NumericSearch) {
            case .OrderedSame, .OrderedDescending:
                message = "请在设备的\"设置-隐私-相机\"中允许访问相机。"
                alertActionController.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: nil))
                alertActionController.addAction(UIAlertAction(title: "确定", style: .Default, handler: { _ -> Void in
                    UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
                }))
            case .OrderedAscending:
                // Do Nothing
                message = "请设置允许访问相机。"
                alertActionController.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Cancel, handler: nil))
            }
            
            alertActionController.message = message
            
            presentViewController(alertActionController, animated: true, completion: nil)
            
            return false
        }
        return true
    }
    
}