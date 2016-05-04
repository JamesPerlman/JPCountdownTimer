//
//  NSLayoutConstraint+ConvenienceMethods.swift
//  James Perlman
//
//  Created by James on 4/1/16.
//  Copyright © 2016 App Actual. All rights reserved.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    class func equalConstraintWithItem(firstItem:AnyObject, attribute:NSLayoutAttribute, toItem secondItem:AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstItem, attribute: attribute, relatedBy: .Equal, toItem: secondItem, attribute: attribute, multiplier: 1.0, constant: 0.0)
    }
    
    class func centerXWithItem(firstItem:AnyObject, toItem secondItem:AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint.equalConstraintWithItem(firstItem, attribute: .CenterX, toItem: secondItem)
    }
    
    class func centerYWithItem(firstItem:AnyObject, toItem secondItem:AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint.equalConstraintWithItem(firstItem, attribute: .CenterY, toItem: secondItem)
    }
    
    class func equalHeightWithItem(firstItem:AnyObject, toItem secondItem:AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint.equalConstraintWithItem(firstItem, attribute: .Height, toItem: secondItem)
    }
    
    class func equalWidthWithItem(firstItem:AnyObject, toItem secondItem:AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint.equalConstraintWithItem(firstItem, attribute: .Width, toItem: secondItem)
    }
    
    class func equalSizeAndCentersWithItem(firstItem:AnyObject, toItem secondItem:AnyObject) -> [NSLayoutConstraint] {
        let w = self.equalWidthWithItem(firstItem, toItem: secondItem)
        let h = self.equalHeightWithItem(firstItem, toItem: secondItem)
        let x = self.centerXWithItem(firstItem, toItem: secondItem)
        let y = self.centerYWithItem(firstItem, toItem: secondItem)
        return [w,h,x,y]
    }
    
    class func alignBottomOfItem(firstItem:AnyObject, toTopOfItem secondItem:AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstItem, attribute: .Bottom, relatedBy: .Equal, toItem: secondItem, attribute: .Top, multiplier: 1.0, constant: 0.0)
    }
    
    class func alignBottomOfItem(firstItem:AnyObject, toBottomOfItem secondItem:AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstItem, attribute: .Bottom, relatedBy: .Equal, toItem: secondItem, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
    }
    
    class func alignTopOfItem(firstItem:AnyObject, toTopOfItem secondItem:AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstItem, attribute: .Top, relatedBy: .Equal, toItem: secondItem, attribute: .Top, multiplier: 1.0, constant: 0.0)
    }
    
    class func alignTopOfItem(firstItem:AnyObject, toBottomOfItem secondItem:AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstItem, attribute: .Top, relatedBy: .Equal, toItem: secondItem, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
    }
}