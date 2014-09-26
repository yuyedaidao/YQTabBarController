//
//  ViewController.swift
//  YQTabBarController
//
//  Created by Wang on 14-9-23.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var rootController:YQTabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        var vcs:[UIViewController] = [FirstViewController(nibName:"FirstViewController", bundle: nil),YQNavigationController(rootViewController: SecondViewController(nibName: "SecondViewController", bundle: nil)),ThirdViewController(nibName: "ThirdViewController", bundle: nil),FourthViewController(nibName: "FourthViewController", bundle: nil)]
        var imageNames:[String] = ["1","2","3","1"]
        var titles:[String] = ["发现","新闻","梦想","我的"]
        rootController = YQTabBarController(viewControllers:vcs, titles: titles, imageNames:imageNames)
        rootController?.view.backgroundColor = UIColor.redColor()
        rootController?.didSelectedViewControllerClosure = { index,viewController in
            NSLog("did clicked at index %d", index)
        }
        self.presentViewController(rootController!, animated: true, completion: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

