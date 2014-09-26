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

####配置文件 YQTabBarConfigure 自行对号入座

    //tabbar背景颜色
    let YQTabBarBackgroundColor = UIColor.grayColor()
    let YQTabBarHeight:CGFloat = 50
    let YQTitlePositionAdjustment:UIOffset = UIOffsetZero
    //badge(小数字)圆圈北京颜色
    let YQBadgeBackgroundColor = UIColor.redColor()
    let YQImagePositionAdjustment:UIOffset = UIOffsetZero
    //badge(小数字)颜色
    let YQBadgeTextColor:UIColor = UIColor.whiteColor()
    let YQBadgeTextFont:UIFont! = UIFont.systemFontOfSize(12)
    let YQBadgePositionAdjustment:UIOffset! = UIOffsetZero

    let YQUnselectedBackgroundImage:UIImage? = nil
    let YQSelectedBackgroundImage:UIImage? = nil
    let YQUnselectedBackgroundColor:UIColor? = UIColor.groupTableViewBackgroundColor()
    let YQSelectedBackgroundColor:UIColor? = UIColor.orangeColor()

    let YQTabBarAnimationDuration:NSTimeInterval = 0.2
    
#### 常用方法
      
      //隐藏(显示)
      self.yqTabBar.showTabBar(false)
      //出现可爱的小数字
      self.yqTabBarItem.badgeValue = 3 
      //推出新视图时隐藏tabBar
      self.hidesYQTabBarWhenPushed(true)
       
  **严重注意:**相应的导航视图必须是YQNavigationController(继承了UINavigationController,丝毫不影响原有的效果,品质保证请放心使用)
  
![gif]()
    
