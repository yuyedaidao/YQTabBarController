//
//  YQTabBarController.swift
//  YQTabBarController
//
//  Created by Wang on 14-9-23.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

import UIKit


class YQTabBarController: UIViewController {

    var viewControllers:[UIViewController]!
    var titles:[String]?
    var imageNames:[String]!
    var tabBar:YQTabBar!
    
    init(viewControllers:[UIViewController],titles:[String]?,imageNames:[String]!) {
       
        super.init()
        
        self.viewControllers = viewControllers
        self.titles = titles
        self.imageNames = imageNames
        
        tabBar = YQTabBar()
        tabBar.frame = CGRectMake(0, self.view.bounds.size.height-YQTabBar.tabBarHeight, self.view.bounds.size.width, YQTabBar.tabBarHeight)
        self.view.addSubview(self.tabBar)
        
        //
        if let titleCount = self.titles?.count{
            if(titleCount<self.viewControllers.count){
                fatalError("标题数不足")
            }
        }
        
        if(self.imageNames.count<self.viewControllers.count){
            fatalError("图片数不足")
        }
        
        var width:CGFloat = self.view.bounds.size.width / CGFloat(self.viewControllers.count)
     
        for (index,vc) in enumerate(self.viewControllers){
            var rect:CGRect = CGRectMake(CGFloat(index) * width, 0, width, YQTabBar.tabBarHeight)
            var selectedImage:UIImage = UIImage(named: "\(self.imageNames[index])_b")
            var unselectedImage:UIImage = UIImage(named: "\(self.imageNames[index])_a")
            
            var tabBarItem:YQTabBarItem = YQTabBarItem(frame: rect, title: self.titles?[index], selectedImage: selectedImage, unselectedImage: unselectedImage)
            self.tabBar.addTabBarItem(tabBarItem)
        }
        
    }

//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
