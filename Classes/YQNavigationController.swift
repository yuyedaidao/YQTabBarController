//
//  YQNavigationController.swift
//  YQTabBarController
//
//  Created by Wang on 14-9-26.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

import UIKit

class YQNavigationController: UINavigationController {

    var shouldHideTabBarWhenPushed:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated:animated)
        NSLog("hello")
        if(self.shouldHideTabBarWhenPushed){
            NSLog("next Hello")
            self.yqTabBar.showTabBar(false, animated: true)
        }
    }
    
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        var vc = super.popViewControllerAnimated(animated)
        
        if(self.shouldHideTabBarWhenPushed && self.viewControllers.count==1){
            self.yqTabBar.showTabBar(true, animated: true)
        }
        return vc
    }
    
    override func popToRootViewControllerAnimated(animated: Bool) -> [AnyObject]? {
        var objs = super.popToRootViewControllerAnimated(animated)
        if(self.shouldHideTabBarWhenPushed && self.viewControllers.count==1){
            self.yqTabBar.showTabBar(true, animated: true)
        }
        return objs
    }
    override func popToViewController(viewController: UIViewController, animated: Bool) -> [AnyObject]? {
        var objs = super.popToViewController(viewController, animated: animated)
        if(self.shouldHideTabBarWhenPushed && self.viewControllers.count==1){
            self.yqTabBar.showTabBar(true, animated: true)
        }
        return objs
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
