//
//  ViewController.swift
//  RefurViewer
//
//  Created by Ray Park on 2015. 9. 21..
//  Copyright © 2015년 Ray Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet var tView: UITableView!
    
    
    var items:NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
       
        
        let url:NSURL! = NSURL(string: "http://reikop.com:8888/mac/fr")!
        let data = NSData(contentsOfURL: url)
        
        
        do{
            let json:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            items = json["data"] as! NSArray
            let updateDt:NSTimeInterval = json.valueForKey("update") as! Double
            let dt = NSDate(timeIntervalSince1970: updateDt / 1000)
            
            
            
            print(dt);
//            for item in data{
//                print(item["title"])
//            }
            
        self.tView.dataSource = self
        }catch{
            print(error)
        }



        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftBlogs.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tabView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = "test"
        return cell;
    }*/
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       return (items?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = items?[indexPath.row]["title"] as? String
        return cell
    }

    

}

