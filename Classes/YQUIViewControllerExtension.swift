//
//  YQUIViewControllerExtension.swift
//  YQTabBarController
//
//  Created by Wang on 14-9-26.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

//import Foundation
import UIKit
extension UIViewController{
    var yqTabBarController:YQTabBarController{
        return YQTabBarController.shareInstance
    }
    var yqTabBar:YQTabBar{
        return YQTabBarController.shareInstance.tabBar
    }
    var yqTabBarItem:YQTabBarItem!{
        for (index,vc) in enumerate(YQTabBarController.shareInstance.viewControllers){
            if vc == self{
                return YQTabBarController.shareInstance.tabBar.tabBarItems[index]
            }
        }
        return nil
    }
    var yqNavigationController:YQNavigationController?{
        return self.navigationController as? YQNavigationController
    }
    func hidesYQTabBarWhenPushed(hide:Bool){
        self.yqNavigationController?.shouldHideTabBarWhenPushed = hide
    }

}
