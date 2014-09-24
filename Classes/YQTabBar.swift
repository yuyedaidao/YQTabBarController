//
//  YQTabBar.swift
//  YQTabBarController
//
//  Created by Wang on 14-9-23.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

import UIKit

class YQTabBar: UIView {
    
    var tabBarItems:[YQTabBarItem] = [YQTabBarItem]()
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.grayColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    class var tabBarHeight:CGFloat{
        return 50
    }

    required init(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    func addTabBarItem(tabBarItem:YQTabBarItem){
        self.tabBarItems.append(tabBarItem)
        self.addSubview(tabBarItem)
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
