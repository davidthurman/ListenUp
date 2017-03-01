//
//  CategoriesViewController.swift
//  ListenUp
//
//  Created by David Thurman on 2/28/17.
//  Copyright © 2017 David Thurman. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    var tagToCategory: [Int : String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        populateScroll()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateScroll(){
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let scrollHeight = (Constants.categories.count * 100) + 300
        
        self.scrollView.contentSize = CGSize(width: screenWidth, height: CGFloat(scrollHeight));
        
        //This will keep track of what height you need to append each UI Element
        var scrollViewHeightIndex = 50
        
        let label = UILabel(frame: CGRect(x: 0, y: scrollViewHeightIndex, width: 200, height: 21))
        label.text = "Categories:"
        label.center.x = self.view.center.x
        label.textAlignment = .center
        label.textColor = UIColor(red:255, green:255, blue:255, alpha:1.0)
        self.scrollView.addSubview(label)
        scrollViewHeightIndex = scrollViewHeightIndex + 50
        
        var count = 1
        for category in Constants.categories {
            
            let labelPosition = (screenWidth / 2) + 75
            
            let label = UILabel(frame: CGRect(x: 310, y: scrollViewHeightIndex, width: 200, height: 21))
            label.center.x = self.view.center.x
            //label.textAlignment = .center
            label.text = category
            label.textColor = UIColor(red:255, green:255, blue:255, alpha:1.0)
            self.scrollView.addSubview(label)
            
            let switchDemo = UISwitch(frame: CGRect(x:Int(labelPosition),y: scrollViewHeightIndex, width:Int(screenWidth), height: 50))
            switchDemo.isOn = true
            switchDemo.tag = count
            switchDemo.setOn(true, animated: false);
            //switchDemo.addTarget(self, action: "switchValueDidChange:", for: .valueChanged);
            self.scrollView.addSubview(switchDemo);
            scrollViewHeightIndex = scrollViewHeightIndex + 50
            tagToCategory[count] = category
            count = count + 1
            
        }
    }
    
    @IBAction func startAction(_ sender: AnyObject) {
        Constants.selectedCategories = []
        for x in 1...Constants.categories.count {
            if let category = self.view.viewWithTag(x) as? UISwitch {
                if category.isOn {
                    Constants.selectedCategories.append(tagToCategory[x]!)
                }
            }
            
        }
        self.performSegue(withIdentifier: "startSegue", sender: self)
    }

}
