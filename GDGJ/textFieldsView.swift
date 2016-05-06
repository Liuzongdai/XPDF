//
//  textFieldsView.swift
//  XPDF
//
//  Created by 刘宗岱 on 16/4/11.
//  Copyright © 2016年 蓝之青. All rights reserved.
//

import UIKit

protocol textFieldsViewPresentable {
    var icons:[String] {  get }
    var placeHolders:[String] {  get }
    var keyBoard:[UIKeyboardType] {  get }
    var secureTextEntry:[Bool] {  get }
    var itemHeight:CGFloat {  get }
    var itemCount:Int {  get }
    var placeHoldersColor:UIColor { get }
    var paddingImgSize:[CGSize] { get }
    var line:String { get }
}

class textFieldsView: UIView {
    

    var textFields:[UITextField] = []
    var configure:textFieldsViewPresentable!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    init(frame: CGRect,configure:textFieldsViewPresentable) {
        super.init(frame: frame)
        configureView(configure)
    }

    private func configureView(configure:textFieldsViewPresentable) {
        var i = 0
        var y:CGFloat = 0.2*configure.itemHeight
        for(i=0;i<configure.itemCount;i++) {
            let textField = UITextField(frame: CGRect(x: 0, y: y, width: self.frame.size.width, height: configure.itemHeight))
            let paddingView = UIView(frame: CGRectMake(0, 0, 51, textField.bounds.height))
            textField.leftView = paddingView
            textField.leftViewMode = UITextFieldViewMode.Always
            let paddingImageView = UIImageView(image: UIImage(named: configure.icons[i]))
            paddingImageView.center = CGPoint(x: paddingView.center.x, y: paddingView.center.y+10)
            paddingImageView.frame.size = configure.paddingImgSize[i]
            textField.addSubview(paddingImageView)
            
            textField.keyboardType = configure.keyBoard[i]
            textField.secureTextEntry = configure.secureTextEntry[i]
            textField.borderStyle = UITextBorderStyle.None
            textField.textColor = configure.placeHoldersColor
            textField.attributedPlaceholder = NSAttributedString(string: configure.placeHolders[i], attributes: [NSForegroundColorAttributeName:UIColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)])
            
            let lineImg = UIImageView(image: UIImage(named: configure.line))
            lineImg.frame = CGRect(x: 0, y: configure.itemHeight-5, width: self.frame.width, height: self.frame.width*0.013)
            textField.addSubview(lineImg)
            self.addSubview(textField)
            y += configure.itemHeight * 1.2
            self.textFields.append(textField)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        print(".......")
        configureView(configure)

        super.awakeFromNib()

    }
    
}
