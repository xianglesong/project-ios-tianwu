//
//  ViewController.swift
//  Sections
//
//  Created by Kim Topley on 10/11/14.
//  Copyright (c) 2014 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    let sectionsTableIdentifier = "SectionsTableIndentifier"
    var names: [String: [String]]!
    var keys: [String]!
    var searchBar : UISearchBar!
    var myWebView:UIWebView = UIWebView(frame: CGRectMake(0, 0, 0, 0));
    
    @IBOutlet weak var tableView: UITableView!
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
        
        let path = NSBundle.mainBundle().pathForResource("sortednames", ofType: "plist")
        
        let namesDict = NSDictionary(contentsOfFile: path!)
        names = namesDict as! [String: [String]]
        keys = (namesDict!.allKeys as! [String]).sort()
        
        let resultsController = SearchResultsController()
//        resultsController.names = names
//        resultsController.keys = keys
        searchController = UISearchController(searchResultsController: resultsController)
        
        searchBar = searchController.searchBar
        //        searchBar.scopeButtonTitles = ["All", "Short", "Long"]
        searchBar.placeholder = "Enter a search term"
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
        searchController.searchResultsUpdater = resultsController
        searchBar.delegate = self;
        
        tableView.sectionIndexBackgroundColor = UIColor.blackColor()
        tableView.sectionIndexTrackingBackgroundColor = UIColor.darkGrayColor()
        tableView.sectionIndexColor = UIColor.whiteColor()
        
        //        searchController.active = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table View Data Source Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let nameSection = names[key]!
        return nameSection.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(sectionsTableIdentifier, forIndexPath: indexPath)
        
        let key = keys[indexPath.section]
        let nameSection = names[key]!
        cell.textLabel?.text = nameSection[indexPath.row]
        
        return cell
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return keys
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
        NSLog("search bar did end edit " + query!)
        // let url = NSURL(string: "http://search.91tianwu.com/" + query!);
        // let request = NSURLRequest(URL:url!);
//        dismissViewControllerAnimated(true, completion: nil)
//        ((UIApplication.sharedApplication().delegate) as! AppDelegate).setSearch(query!);
//        self.navigationController?.pushViewController(MySearchViewController(nibName:"MySearchViewController",bundle: nil), animated: true)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        NSLog("search bar clicked ")
        let query = searchBar.self.text
        NSLog("search bar clicked " + query!)
        // let url = NSURL(string: "http://search.91tianwu.com/" + query!);
        // let request = NSURLRequest(URL:url!);
        
        // pass params
        // SearchViewController
    
        // var height = self.navigationController?.navigationBar.frame.size.height
        // myWebView = UIWebView(frame: CGRectMake(0, height!, UIScreen.mainScreen().bounds.width,   UIScreen.mainScreen().bounds.height));
        // self.myWebView.loadRequest(NSURLRequest(URL: NSURL(string: "http://search.91tianwu.com/searchm?qparam="+query!)!))
        // self.view.addSubview(self.myWebView)
        // myWebView.loadRequest(request);
        dismissViewControllerAnimated(true, completion: nil)
        ((UIApplication.sharedApplication().delegate) as! AppDelegate).setSearch(query!);
        self.navigationController?.pushViewController(MySearchViewController(nibName:"MySearchViewController",bundle: nil), animated: true)
    }
    
    
    
}

