//
//  ListTableCell.swift
//  RefurViewer
//
//  Created by Ray Park on 2015. 9. 23..
//  Copyright © 2015년 Ray Park. All rights reserved.
//

import UIKit

class ListTableCell : UITableViewCell {
    
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var titleView: UILabel!
    
    @IBOutlet var descView: UITextView!
    
    
    func setContent(imgSrc:String, title:String, desc:String){
        let src:NSURL! = NSURL(string: imgSrc)
        let data:NSData! = NSData(contentsOfURL: src)
        let img:UIImage? = UIImage(data: data)

        imgView.image = img
        titleView.text = title
        descView.text = desc
    }
    
}