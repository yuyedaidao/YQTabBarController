//
//  YQTabBarItem.swift
//  YQTabBarController
//
//  Created by Wang on 14-9-23.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

import UIKit

class YQTabBarItem: UIControl {
    
    
    var title:String?
    var titlePositionAdjustment:UIOffset!
    var unselectedTitleAttributes:Dictionary<NSString,AnyObject>!
    var selectedTitleAttributes:Dictionary<NSString,AnyObject>!
    
    
    var unselectedBackgroundImage:UIImage?
    var selectedBackgroundImage:UIImage?
    var unselectedBackgroundColor:UIColor?
    var selectedBackgroundColor:UIColor?
    var unselectedImage:UIImage!
    var selectedImage:UIImage!
    var imagePositionAdjustment:UIOffset! = UIOffsetZero
    
    var badgeValue:Int?
    
    lazy var badgeBackgroundColor:UIColor! = UIColor.redColor()
    lazy var badgeTextColor:UIColor! = UIColor.whiteColor()
    lazy var badgeTextFont:UIFont! = UIFont.systemFontOfSize(12)
    lazy var badgePositionAdjustment:UIOffset! = UIOffsetZero

    init(frame:CGRect,title:String?,selectedImage:UIImage!,unselectedImage:UIImage!){
        super.init(frame:frame)
        self.title = title
        self.unselectedImage = unselectedImage;
        self.selectedImage = selectedImage;
        self.commonInitialization()
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
        self.titlePositionAdjustment = UIOffsetZero
        
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.

    
    override func drawRect(rect: CGRect)
    {
        // Drawing code

        var titleAttributes:Dictionary<NSString,AnyObject>?
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
            
            var imageStartingY = round((size.height-imageSize.height-titleSize.height))/2
            image.drawInRect(CGRectMake(round((size.width-imageSize.width)/2)+imagePositionAdjustment.horizontal,imageStartingY+imagePositionAdjustment.vertical,imageSize.width,imageSize.height))
            
            CGContextSetFillColorWithColor(context, (titleAttributes?[NSForegroundColorAttributeName] as UIColor).CGColor)
            title.drawInRect(CGRectMake(round((size.width-titleSize.width)/2)+titlePositionAdjustment.horizontal, imageStartingY+imageSize.height+titlePositionAdjustment.vertical, titleSize.width, titleSize.height), withAttributes: titleAttributes)
            
//            if let shadow:NSShadow = (titleAttributes?[NSShadowAttributeName] as? NSShadow){
//                CGContextSetShadowWithColor(context, shadow.shadowOffset, 1.0, shadow.shadowColor?.CGColor)
//            }
            
        }else{
            var rect:CGRect = CGRectMake(round((size.width-imageSize.width)/2)+imagePositionAdjustment.horizontal,round((size.height-imageSize.height)/2)+imagePositionAdjustment.vertical, imageSize.width, imageSize.height)
            image.drawInRect(rect)
           
        }
        
        //画badges
        
        if let badge = self.badgeValue{
            if(badge>0){
                
                
                var badgeStr:NSString = "\(badge)"
                var badgeSize:CGSize = badgeStr.boundingRectWithSize(CGSizeMake(size.width, 20), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:self.badgeTextFont], context: nil).size
                var textOffset:CGFloat = 2.0
                
                if(badgeSize.width < badgeSize.height){//否则单个数字时不是正圆
                    badgeSize = CGSizeMake(badgeSize.height, badgeSize.height)
                }
                
                var badgeBackgroundFrame:CGRect = CGRectMake(round((size.width+imageSize.width) / 2 * 0.9) +
                    self.badgePositionAdjustment.horizontal,
                    textOffset + self.badgePositionAdjustment.vertical,
                    badgeSize.width + 2 * textOffset, badgeSize.height + 2 * textOffset)
                
                CGContextSetFillColorWithColor(context, self.badgeBackgroundColor.CGColor)
                CGContextFillEllipseInRect(context, badgeBackgroundFrame)
                
                var badgeTextStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()
                badgeTextStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
                badgeTextStyle.alignment = NSTextAlignment.Center
                
                var badgeTextAttributes:Dictionary<NSString,AnyObject> = [NSFontAttributeName:self.badgeTextFont,NSForegroundColorAttributeName:self.badgeTextColor,NSParagraphStyleAttributeName:badgeTextStyle]
                
                CGContextSetFillColorWithColor(context, self.badgeTextColor.CGColor)
                badgeStr.drawInRect(CGRectMake(CGRectGetMinX(badgeBackgroundFrame)+textOffset, CGRectGetMinY(badgeBackgroundFrame)+textOffset, badgeSize.width, badgeSize.height), withAttributes: badgeTextAttributes)
                
                
            }
        }
        
        CGContextRestoreGState(context)
    }//draw
    

}
