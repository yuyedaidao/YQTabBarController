//
//  SecondViewController.swift
//  YQTabBarController
//
//  Created by Wang on 14-9-24.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hidesYQTabBarWhenPushed(true)
        // Do any additional setup after loading the view.
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "详情", style: UIBarButtonItemStyle.Bordered, target: self, action: "push")
    }

    func push(){
        var vc:FourthViewController = FourthViewController(nibName: "FourthViewController", bundle: nil)
        self.yqNavigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSLog("%d -- %d", 2,1)
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        NSLog("%d -- %d", 2,2)
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSLog("%d -- %d", 2,3)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        NSLog("%d -- %d", 2,4)
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
