//
//  Constant.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/18.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import Foundation
import UIKit

let kDeviceWidth = UIScreen.main.bounds.size.width
let kDeviceHeight = UIScreen.main.bounds.size.height
let kNavigationBarHeight:CGFloat = 44

let kVCBgColor = UIColor.clear.colorWithHex(rgb: 0xf7f7f8, alpha: 1)

// UILabel
func buildLabel(rect:CGRect, labelColor:UIColor, text:String, textColor:UIColor, fontSize:CGFloat, align:NSTextAlignment) -> UILabel {
    let label = UILabel(frame: rect)
    label.backgroundColor = labelColor
    label.text = text
    label.textColor = textColor
    label.font = UIFont.systemFont(ofSize: fontSize)
    label.textAlignment = align
    return label
}

//UIButton
func buildButton(rect:CGRect, bgColor:UIColor, text:String, font:CGFloat, textColor:UIColor) -> UIButton {
    let btn = UIButton(type: .custom)
    btn.frame = rect
    btn.backgroundColor = bgColor
    btn.setTitle(text, for: .normal)
    btn.setTitleColor(textColor, for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: font)
    return btn
}

//图片
func buildImageView(rect:CGRect, iconStr:String) -> UIImageView {
    let icon = UIImageView(frame: rect)
    icon.image = UIImage(named: iconStr)
    return icon
}

//线
func buildLine(rect:CGRect, color:UIColor) -> UIView {
    let line = UIView(frame: rect)
    line.backgroundColor = color
    return line
}



