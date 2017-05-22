//
//  XSProjectFlowView.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/22.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

let titleText = "项目合集周期"


class XSProjectFlowView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        let icon = UIImageView(frame: CGRect.init(x: 10, y: 21, width: 14, height: 14))
        icon.image = UIImage(named: "icon_p2")
        
        let title = buildLabel(rect: CGRect.init(x: icon.maxX + 5, y: icon.y, width: kDeviceWidth - icon.maxX - 5, height: 14), labelColor: UIColor.clear, text: titleText, textColor: UIColor.clear.colorWithHex(rgb: 0xa1a5aa, alpha: 1), fontSize: 14, align: .left)
        
        //icon之间的space
        let space:CGFloat = (kDeviceWidth - 50*2 - 8*3)/2
        
        let iconA = buildImageView(rect: CGRect.init(x: 50, y: 77, width: 8, height: 8), iconStr: "icon_p1")
        let iconB = buildImageView(rect: CGRect.init(x: iconA.maxX + space, y: iconA.y, width: 8, height: 8), iconStr: "icon_p1")
        let iconC = buildImageView(rect: CGRect.init(x: iconB.maxX + space, y: iconA.y, width: 8, height: 8), iconStr: "icon_p1")
        
        let lineA = buildLine(rect: CGRect.init(x: iconA.maxX, y: 0, width: space, height: 1), color: UIColor.clear.colorWithHex(rgb: 0x52adff, alpha: 0.6))
        lineA.centerY = iconA.centerY
        let lineB = buildLine(rect: CGRect.init(x: iconB.maxX, y: 0, width: space, height: 1), color: UIColor.clear.colorWithHex(rgb: 0x52adff, alpha: 0.6))
        lineB.centerY = iconA.centerY
        
        let lock = buildLabel(rect: CGRect.init(x: iconA.maxX, y: 55, width: space, height: 14), labelColor: UIColor.clear, text: "持有365天", textColor: UIColor.clear.colorWithHex(rgb: 0xa1a5aa, alpha: 1), fontSize: 12, align: .center)
        let exit = buildLabel(rect: CGRect.init(x: iconB.maxX, y: 55, width: space, height: 14), labelColor: UIColor.clear, text: "转让退出", textColor: UIColor.clear.colorWithHex(rgb: 0xa1a5aa, alpha: 1), fontSize: 12, align: .center)
        
        let flowA = buildLabel(rect: CGRect.init(x: 0, y: 94, width: 70, height: 17), labelColor: UIColor.clear, text: "委托加入", textColor: UIColor.clear.colorWithHex(rgb: 0x252c3d, alpha: 1), fontSize: 12, align: .center)
        flowA.centerX = iconA.centerX
        let flowB = buildLabel(rect: CGRect.init(x: 0, y: 94, width: 70, height: 17), labelColor: UIColor.clear, text: "出借到期", textColor: UIColor.clear.colorWithHex(rgb: 0x252c3d, alpha: 1), fontSize: 12, align: .center)
        flowB.centerX = iconB.centerX
        let flowC = buildLabel(rect: CGRect.init(x: 0, y: 94, width: 70, height: 17), labelColor: UIColor.clear, text: "退出成功", textColor: UIColor.clear.colorWithHex(rgb: 0x252c3d, alpha: 1), fontSize: 12, align: .center)
        flowC.centerX = iconC.centerX
        
        let flowAtm = buildLabel(rect: CGRect.init(x: 0, y: 114, width: 70, height: 14), labelColor: UIColor.clear, text: "当天起息", textColor: UIColor.clear.colorWithHex(rgb: 0xa1a5aa, alpha: 1), fontSize: 12, align: .center)
        flowAtm.centerX = iconA.centerX
        let flowBtm = buildLabel(rect: CGRect.init(x: 0, y: 114, width: 70, height: 14), labelColor: UIColor.clear, text: "2017.05.21", textColor: UIColor.clear.colorWithHex(rgb: 0xa1a5aa, alpha: 1), fontSize: 12, align: .center)
        flowBtm.centerX = iconB.centerX
        let flowCtm = buildLabel(rect: CGRect.init(x: 0, y: 114, width: 70, height: 14), labelColor: UIColor.clear, text: "出借结束", textColor: UIColor.clear.colorWithHex(rgb: 0xa1a5aa, alpha: 1), fontSize: 12, align: .center)
        flowCtm.centerX = iconC.centerX
        
        self.addSubview(icon)
        self.addSubview(title)
        self.addSubview(lineA)
        self.addSubview(lineB)
        self.addSubview(iconA)
        self.addSubview(iconB)
        self.addSubview(iconC)
        self.addSubview(lock)
        self.addSubview(exit)
        self.addSubview(flowA)
        self.addSubview(flowB)
        self.addSubview(flowC)
        self.addSubview(flowAtm)
        self.addSubview(flowBtm)
        self.addSubview(flowCtm)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
