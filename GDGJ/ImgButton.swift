//
//  NormalButton.swift
//  XPDF
//
//  Created by 刘宗岱 on 16/4/12.
//  Copyright © 2016年 蓝之青. All rights reserved.
//

import UIKit

protocol ImgButtonPresentable {
    var imgURL:String{ get }
    var radius:CGFloat { get }

}



class ImgButton: UIButton {

    var index:Int?

    
    init(frame: CGRect,configure:ImgButtonPresentable){
        super.init(frame: frame)
        configureView(configure)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    private func configureView(configure:ImgButtonPresentable) {
    
        self.setBackgroundImage(UIImage(named: configure.imgURL), forState: UIControlState.Normal)
        self.layer.cornerRadius = configure.radius
    
    }
    
    

}
