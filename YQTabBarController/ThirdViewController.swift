//
//  ThirdViewController.swift
//  YQTabBarController
//
//  Created by Wang on 14-9-24.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSLog("%d -- %d", 3,1)
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        NSLog("%d -- %d", 3,2)
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSLog("%d -- %d", 3,3)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        NSLog("%d -- %d", 3,4)
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
