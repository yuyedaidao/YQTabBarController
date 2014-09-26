YQTabBarController
==================

###Swift写的TabBarController

###极其容易且灵活定制的TabBarController

####使用方法

    var vcs:[UIViewController] = [FirstViewController(nibName:"FirstViewController", bundle:           nil),YQNavigationController(rootViewController: SecondViewController(nibName: "SecondViewController", bundle: nil)),ThirdViewController(nibName: "ThirdViewController", bundle: nil),FourthViewController(nibName: "FourthViewController", bundle: nil)]
    var imageNames:[String] = ["1","2","3","1"] //**注意** 图片名字必须是X_a.png(正常状态下)和X_b.png(选中状态下)的形式
    var titles:[String] = ["发现","新闻","梦想","我的"]
    var tabBarController = YQTabBarController(viewControllers:vcs, titles: titles, imageNames:imageNames)
    tabBarController?.didSelectedViewControllerClosure = { index,viewController in
            NSLog("did clicked at index %d", index)
        }
        
######图片必须有，标题可选


    
#### 常用方法
      
      //隐藏(显示)
      self.yqTabBar.showTabBar(false)
      //出现可爱的小数字
      self.yqTabBarItem.badgeValue = 3 
      //推出新视图时隐藏tabBar
      self.hidesYQTabBarWhenPushed(true)
       
  **严重注意:**相应的导航视图必须是YQNavigationController(继承了UINavigationController,丝毫不影响原有的效果,品质保证请放心使用)
  
![gif](https://github.com/yuyedaidao/YQTabBarController/blob/master/YQTabBarController/tabBar.gif)

####配置文件 YQTabBarConfigure 自行对号入座

    //tabbar背景颜色
    let YQTabBarBackgroundColor = UIColor.grayColor()
    //tabBar高度
    let YQTabBarHeight:CGFloat = 50
    //标题偏移
    let YQTitlePositionAdjustment:UIOffset = UIOffsetZero
    //badge(小数字)圆圈北京颜色
    let YQBadgeBackgroundColor = UIColor.redColor()
    //tabBarItem图片偏移量
    let YQImagePositionAdjustment:UIOffset = UIOffsetZero
    //badge(小数字)颜色
    let YQBadgeTextColor:UIColor = UIColor.whiteColor()
    //badge字体
    let YQBadgeTextFont:UIFont! = UIFont.systemFontOfSize(12)
    //badge偏移量
    let YQBadgePositionAdjustment:UIOffset! = UIOffsetZero
    
    //tabBarItem正常状态下的背景颜色 没有就设置nil
    let YQUnselectedBackgroundColor:UIColor? = UIColor.groupTableViewBackgroundColor()
    //tabBarItem选中状态下的背景图片 没有就设置nil
    let YQSelectedBackgroundColor:UIColor? = UIColor.orangeColor()

    //tabBar隐藏出现时动画的时间
    let YQTabBarAnimationDuration:NSTimeInterval = 0.2
    
