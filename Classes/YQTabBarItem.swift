//
//  YQTabBarItem.swift
//  YQTabBarController
//
//  Created by Wang on 14-9-23.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

import UIKit

class YQTabBarItem: UIControl {
    
    var imagePositionAdjustment:UIOffset! = UIOffsetZero
    
    var title:String?
    var titleOffset:UIOffset!
    var unselectedTitleAttributes:Dictionary<String,AnyObject>!
    var selectedTitleAttributes:Dictionary<String,AnyObject>!
    
    var unselectedBackgroundImage:UIImage?
    var selectedBackgroundImage:UIImage?
    var unselectedBackgroundColor:UIColor?
    var selectedBackgroundColor:UIColor?
    var unselectedImage:UIImage!
    var selectedImage:UIImage!

    lazy var badgeBackgroundColor:UIColor! = UIColor.redColor()
    lazy var badgeTextColor:UIColor! = UIColor.whiteColor()
    lazy var badgeTextFont:UIFont! = UIFont.systemFontOfSize(12)
    lazy var badgePositionAdjustment:UIOffset! = UIOffsetZero

    init(frame:CGRect,title:String?,selectedImage:UIImage!,unselectedImage:UIImage!){
        super.init(frame:frame)
        self.unselectedImage = unselectedImage;
        self.selectedImage = selectedImage;
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInitialization()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInitialization()
    }
    
    func commonInitialization(){
        self.backgroundColor = UIColor.clearColor()
        unselectedTitleAttributes = [NSFontAttributeName:UIFont.systemFontOfSize(12),NSForegroundColorAttributeName:UIColor.blackColor()]
        selectedTitleAttributes = unselectedTitleAttributes
        self.titleOffset = UIOffsetZero
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code

        var titleAttributes:Dictionary<String,AnyObject>?
        var backgroundImage:UIImage?
        var backgroundColor:UIColor?
        var image:UIImage!
        
        if self.selected {
            if (self.title != nil) {
                titleAttributes = self.selectedTitleAttributes
            }
            image = self.selectedImage
            backgroundColor = self.selectedBackgroundColor
            backgroundImage = self.selectedBackgroundImage
        }else{
            if (self.title != nil) {
                titleAttributes = self.unselectedTitleAttributes
            }
            image = self.unselectedImage
            backgroundColor = self.unselectedBackgroundColor
            backgroundImage = self.unselectedBackgroundImage
        }
        
        
        var imageSize:CGSize = image.size
        var size:CGSize = self.frame.size
        
        var context:CGContextRef = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        if let title:NSString = self.title{
            
            var titleSize:CGSize = title.boundingRectWithSize(CGSize(width: size.width,height: 40), options:NSStringDrawingOptions.UsesLineFragmentOrigin , attributes:titleAttributes, context: nil).size
            
        }else{
            var rect:CGRect = CGRectMake((size.width-imageSize.width)/2+imagePositionAdjustment.horizontal,(size.height-imageSize.height)/2+imagePositionAdjustment.vertical, imageSize.width, imageSize.height)
            image.drawInRect(rect)
           
        }
        
        
    }
    

}
