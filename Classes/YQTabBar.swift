//
//  YQTabBar.swift
//  YQTabBarController
//
//  Created by Wang on 14-9-23.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

import UIKit

typealias TabBarItemClickedClosure = (index:Int)->Void

class YQTabBar: UIView {
    
    var tabBarItemClickedClosure:TabBarItemClickedClosure?
    
    var tabBarItems:[YQTabBarItem] = [YQTabBarItem]()
    
    override init() {
        super.init()
        self.backgroundColor = YQTabBarBackgroundColor
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = YQTabBarBackgroundColor
    }
    

    required init(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    func addTabBarItem(tabBarItem:YQTabBarItem){
        self.tabBarItems.append(tabBarItem)
        self.addSubview(tabBarItem)
        tabBarItem.addTarget(self, action:"tabBarItemSelected:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func tabBarItemSelected(tabBarItem:YQTabBarItem){
        if !tabBarItem.selected{
            //更改显示视图
            
            tabBarItem.selected = true
            
            for item in self.tabBarItems{
                if item != tabBarItem{
                    item.selected = false
                }
            }
        }
        if (self.tabBarItemClickedClosure != nil){
            self.tabBarItemClickedClosure!(index: tabBarItem.index)
        }

    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

}
