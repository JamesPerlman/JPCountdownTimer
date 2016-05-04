//
//  JPCountdownTimerView.swift
//  JPCountdownTimerView
//
//  Created by James on 5/4/16.
//  Copyright © 2016 James Perlman. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

@IBDesignable // so we can use it in interface builder
class JPCountdownTimerView: UIView {
    
    // MARK: Designable Vars
    @IBInspectable var initialTitle:String = "TITLE"
    
    @IBInspectable var fontSize:CGFloat = 36.0 {
        didSet {
            label.font = label.font.fontWithSize(fontSize)
        }
    }
    
    // MARK: Private vars
    private var completionClosure:(()->Void) = {}
    private var titles:[String] = []
    private var index:Int = 0
    
   @IBOutlet private weak var label: UILabel!
    
    
    // MARK: Initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    let initialScale = 1.25
    
    func countdown(titles: [String], completion: () -> Void) {
        
        self.titles = titles
        self.index = 0
        self.completionClosure = completion
        
        nextAnimation()
    }
    
    func nextAnimation() {
        if index < titles.count {
            // set title to the next item in titles
            label.text = titles[index]
            index += 1
            
            // scale animation
            let scaleAnimation = CAKeyframeAnimation()
            scaleAnimation.keyPath = "transform.scale"
            scaleAnimation.keyTimes = [0, 0.7]
            scaleAnimation.values = [initialScale, 1]
            scaleAnimation.duration = 1
            scaleAnimation.delegate = self
            self.layer.addAnimation(scaleAnimation, forKey: "scale")
            
            // fade in/out animation
            let opacityAnimation = CAKeyframeAnimation()
            opacityAnimation.keyPath = "opacity"
            opacityAnimation.keyTimes = [0, 0.1, 0.9, 1]
            opacityAnimation.values = [0, 1, 1, 0]
            opacityAnimation.duration = 1
            self.layer.addAnimation(opacityAnimation, forKey: "opacity")
            
            
        } else {
            completionClosure()
        }
    }
    
    // MARK: CAAnimation delegate
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        nextAnimation()
    }
    
    // TODO: Put this into an extension
    @IBOutlet weak private var view:UIView?
    
    
    override func prepareForInterfaceBuilder() {
        self.label.text = initialTitle
    }
    
    // For interface builder (tells auto-layout what size to use for this view)
    
    override func intrinsicContentSize() -> CGSize {
        // we're just gonna use the label's intrinsic content size
        return label.intrinsicContentSize()
    }
    
    //
    func loadNib() {
        let bundle = NSBundle (forClass: JPCountdownTimerView.self)
        bundle.loadNibNamed("JPCountdownTimerView", owner: self, options: nil)
        
        // adding the top level view to the view hierarchy
        view!.frame = self.bounds
        view!.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(view!);
        self.addConstraints(NSLayoutConstraint.equalSizeAndCentersWithItem(view!, toItem: self))
        
        self.label.text = initialTitle
    }
}