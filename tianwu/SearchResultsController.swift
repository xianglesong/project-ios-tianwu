//
//  SearchResultsController.swift
//  Sections
//
//  Created by Kim Topley on 10/11/14.
//  Copyright (c) 2014 Apress. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private let longNameSize = 6
private let shortNamesButtonIndex = 1
private let longNamesButtonIndex = 2

class SearchResultsController: UITableViewController, UISearchResultsUpdating {
    let sectionsTableIdentifier = "SectionsTableIdentifier"
    //    var names:[String: [String]] = [String: [String]]()
    //    var keys: [String] = []
    var filteredNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: UISearchResultsUpdating Conformance
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        //        let buttonIndex = searchController.searchBar.selectedScopeButtonIndex
        filteredNames.removeAll(keepCapacity: true)
        
        if !searchString!.isEmpty{
            
            NSLog(searchString!)
            // self get string
            
            // http request and response
            //            sleep(1000)
            //            self.filteredNames.append("1")
            //            filteredNames.append("2")
            //            filteredNames.append("3")
            let searchPre = "http://isearch.91tianwu.com/solr/collection_autoComplete/pinyinSelect?q=text:";
            let searchPost = "*&wt=json&indent=true&fl=keyword&sort=appearCount%20desc&query=false";
            
            let qurl = searchPre + searchString!.lowercaseString + searchPost

            
        }
        
        self.tableView.reloadData()
    }
    
    
    // MARK: Table View Data Source Methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("filter count: \(filteredNames.count)" )
        return filteredNames.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(sectionsTableIdentifier) as UITableViewCell!
        // search result
        cell.textLabel?.text = filteredNames[indexPath.row]
        return cell
    }
    
    override   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // 提示窗
        //         let alertViewController:UIAlertController = UIAlertController(title:"提示", message:"x\(self.filteredNames[indexPath.row])", preferredStyle: UIAlertControllerStyle.Alert);
        //
        //         let alertView = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil);
        //
        //         alertViewController.addAction(alertView);
        //         self.presentViewController(alertViewController, animated: true, completion: nil);
        
        // jump to search
        NSLog("search tableView clicked")
        let query = self.filteredNames[indexPath.row]
        self.searchDisplayController?.self.searchBar.self.text = query
        NSLog("search tableView clicked" + query)
        
        dismissViewControllerAnimated(true, completion: nil)
        ((UIApplication.sharedApplication().delegate) as! AppDelegate).setSearch(query);
        self.navigationController?.pushViewController(MySearchViewController(nibName:"MySearchViewController",bundle: nil), animated: true)
    }
    
    
}
