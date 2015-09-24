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
    
    @IBAction func searchTouchHandle(sender: AnyObject) {
        let alert:UIAlertController = UIAlertController()
        
        let ok = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            
        }
        
        alert.addAction(ok)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    var items:NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
       
        
        let url:NSURL! = NSURL(string: "http://reikop.com:8888")!
        let data = NSData(contentsOfURL: url)
    
        
        do{
            let json:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            items = json["data"] as? NSArray
            let updateDt:NSTimeInterval = json.valueForKey("update") as! Double
            let dt = NSDate(timeIntervalSince1970: updateDt / 1000)
            
            
            
            print(dt);
//            for item in data{
//                print(item["title"])
//            }
        self.tView.delegate = self
        self.tView.dataSource = self
        self.tView.rowHeight = 90
        }catch{
            print(error)
        }



        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       return (items?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell:ListTableCell = tView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ListTableCell
//        cell.textLabel?.text = items?[indexPath.row]["title"] as? String
        let src:String = items?[indexPath.row]["img"] as! String
        let title:String = items?[indexPath.row]["title"] as! String
        let desc:String = items?[indexPath.row]["specs"] as! String

        cell.setContent(src, title: title, desc: desc)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let href:String = items?[indexPath.row]["href"] as! String
        let encoded:String = href.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        let url:NSURL = NSURL(string: "http://apple.com\(encoded)")!
        UIApplication.sharedApplication().openURL(url)
    }

    

}

