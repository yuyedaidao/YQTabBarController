//
//  YQTabBarController.swift
//  YQTabBarController
//
//  Created by Wang on 14-9-23.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

import UIKit

typealias DidSelectedViewControllerClosure = (index:Int,viewController:UIViewController)

class YQTabBarController: UIViewController {

    var currentIndexOfViewController:Int = 0
    
    var containerView:UIView = UIView()
    var viewControllers:[UIViewController]!
    var titles:[String]?
    var imageNames:[String]!
    var tabBar:YQTabBar!
    var didSelectedViewControllerClosure:DidSelectedViewControllerClosure?
    
    
    var currentViewController:UIViewController?
    
    init(viewControllers:[UIViewController],titles:[String]?,imageNames:[String]!) {
       
        super.init()
        
        self.viewControllers = viewControllers
        self.titles = titles
        self.imageNames = imageNames
        
        self.containerView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.height-YQTabBarHeight)
        self.view.addSubview(self.containerView)
        
        tabBar = YQTabBar(frame:CGRectMake(0, self.view.bounds.size.height-YQTabBarHeight, self.view.bounds.size.width, YQTabBarHeight))
        //闭包回掉
        tabBar.tabBarItemClickedClosure = self.changeViewControllerAtIndex
            
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
            var rect:CGRect = CGRectMake(CGFloat(index) * width, 0, width, YQTabBarHeight)
            var selectedImage:UIImage = UIImage(named: "\(self.imageNames[index])_b")
            var unselectedImage:UIImage = UIImage(named: "\(self.imageNames[index])_a")
            
            var tabBarItem:YQTabBarItem = YQTabBarItem(frame: rect, title: self.titles?[index], selectedImage: selectedImage, unselectedImage: unselectedImage,index:index,tabBar:self.tabBar)
            tabBarItem.badgeValue = 8+index
            self.tabBar.addTabBarItem(tabBarItem)
        }
        
        //显示第一个视图
        self.changeViewControllerAtIndex(currentIndexOfViewController)
        
    }


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
    
    
    func changeViewControllerAtIndex(index:Int){
        var toViewController:UIViewController = self.viewControllers[index]
        
        if let fromViewControoler = self.currentViewController{
            
            fromViewControoler.willMoveToParentViewController(nil)
            self.addChildViewController(toViewController)
            self.containerView.addSubview(toViewController.view)
            toViewController.view.frame = self.containerView.bounds
            fromViewControoler.didMoveToParentViewController(nil)
            toViewController.didMoveToParentViewController(self)
            
        }else{
            //第一次
            self.tabBar.tabBarItems.first?.selected = true
            self.addChildViewController(toViewController)
            self.containerView.addSubview(toViewController.view)
            toViewController.view.frame = self.containerView.bounds
            toViewController.didMoveToParentViewController(self)
        }
        self.currentIndexOfViewController = index
        self.currentViewController = toViewController
    }
    
    //
    
    func tabBarItemClicked(tabBarItem:YQTabBarItem){
        if(currentIndexOfViewController != tabBarItem.index){
            //更换视图
        }
        //执行代理方法
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
