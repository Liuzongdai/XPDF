//
//  InfoFadeView.swift
//  XPDF
//
//  Created by 刘宗岱 on 16/4/19.
//  Copyright © 2016年 蓝之青. All rights reserved.
//

import UIKit

protocol InfoViewDelegate {
    func show(title:String)
    func hidden()
}

let MYORANGECOLOR = UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1)
//let CELLBACKGROUNDCOLOR = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
let GARYCOLOR = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
let MAINREDCOLOR = UIColor(red: 226/255, green: 45/255, blue: 44/255, alpha: 1)

func getScale(x:CGFloat) -> CGFloat {
    return x*(SCREENWIDTH/375.0)
}



class InfoFadeView: UIView,InfoViewDelegate {

  
    var titleLabel:UILabel!
    
    init() {
        super.init(frame: CGRect(x: SCREENWIDTH/2 - 75, y: SCREENHEIGHT/2-45, width: 150, height: 90))
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.textColor = UIColor.whiteColor()
        self.addSubview(titleLabel)
        self.backgroundColor = UIColor.blackColor()
//        self.layer.borderColor = UIColor.whiteColor().CGColor
//        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.alpha = 0.0
        self.hidden = true
//        self.superview?.insertSubview(self, atIndex: (self.superview?.subviews.count)!+1)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(title: String) {
        if self.hidden {
            self.hidden = false
        }
        
        titleLabel.text = title
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.alpha = 1.0

            }) { (finish) -> Void in
                self.hidden()
        }
    }
    
    func hidden() {
        UIView.animateWithDuration(0.5, delay: 2.0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            self.alpha = 0.0
            }) { (finish) -> Void in
                self.hidden = true
        }
    }
    
    
    

}
