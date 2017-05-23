//
//  XSPlandetailsHeaderView.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/22.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

let joinerText = "当前已加入28人，近一个月累计加入686人 >>"

class XSPlandetailsHeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //背景图
        let bgIcon = UIImageView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: 230))
        bgIcon.image = UIImage.init(named: "plandetailsTopBg")
        
        //标题
        let markType = buildLabel(rect: CGRect.init(x: 10, y: 15, width: 40, height: 15), labelColor: UIColor.clear, text: "常规", textColor: UIColor.white, fontSize: 12, align: .center)
        markType.layer.borderWidth = 0.6
        markType.layer.borderColor = UIColor.white.cgColor
        markType.layer.cornerRadius = 3
        
        let title = buildLabel(rect: CGRect.init(x: markType.maxX + 10, y: 15, width: kDeviceWidth - 30 - markType.width, height: 15), labelColor: UIColor.clear, text: "向上冲365天计划", textColor: UIColor.white, fontSize: 15, align: .left)
        
        //收益率
        let invest = buildLabel(rect: CGRect.init(x: 0, y: 75, width: kDeviceWidth, height: 55), labelColor: UIColor.clear, text: "16.20%", textColor: UIColor.white, fontSize: 55, align: .center)
        let investTip = buildLabel(rect: CGRect.init(x: 0, y: invest.maxY + 7, width: kDeviceWidth, height: 14), labelColor: UIColor.clear, text: "预期年化收益率", textColor: UIColor.white, fontSize: 12, align: .center)
        
        //投资进度
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint.init(x: 10, y: 172))
        bezierPath.addLine(to: CGPoint.init(x: kDeviceWidth - 50, y: 172))
        
        let progressBg = CAShapeLayer.init()
        progressBg.lineWidth = 3
        progressBg.fillColor = nil
        progressBg.strokeColor = UIColor.clear.colorWithHex(rgb: 0x2588dd, alpha: 1.0).cgColor
        progressBg.path = bezierPath.cgPath
        
        let progress = CAShapeLayer.init()
        progress.lineWidth = 3
        progress.fillColor = nil
        progress.strokeColor = UIColor.white.cgColor
        progress.path = bezierPath.cgPath
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 0.7
        animation.duration = 1.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        progress.add(animation, forKey: "strokeEnd")
        
        let progressTip = buildLabel(rect: CGRect.init(x: kDeviceWidth - 40, y: 0, width: 30, height: 14), labelColor: UIColor.clear, text: "70%", textColor: UIColor.white, fontSize: 14, align: .left)
        progressTip.centerY = 172 + progressBg.frame.size.height/2.0
        
        //剩余金额
        let totalAmount = buildLabel(rect: CGRect.init(x: 10, y: 195, width: (kDeviceWidth-20)/2, height: 15), labelColor: UIColor.clear, text: "计划总额：1000.22万元", textColor: UIColor.white, fontSize: 12, align: .left)
        let surplusAmount = buildLabel(rect: CGRect.init(x: totalAmount.maxX, y: totalAmount.y, width: (kDeviceWidth-20)/2, height: 15), labelColor: UIColor.clear, text: "剩余金额：500.00万元", textColor: UIColor.white, fontSize: 12, align: .right)
        
        //累计加入
        let joiner = buildButton(rect: CGRect.init(x: 0, y: bgIcon.maxY, width: kDeviceWidth, height: 55), bgColor: UIColor.white, text: joinerText, font: 14, textColor: UIColor.clear.colorWithHex(rgb: 0xff8053, alpha: 1))
        
        //合集周期示意图
        let project = XSProjectFlowView(frame: CGRect.init(x: 0, y: joiner.maxY + 5, width: kDeviceWidth, height: 150))
        
        self.addSubview(bgIcon)
        self.addSubview(markType)
        self.addSubview(title)
        self.addSubview(invest)
        self.addSubview(investTip)
        self.layer.addSublayer(progressBg)
        self.layer.addSublayer(progress)
        self.addSubview(progressTip)
        self.addSubview(totalAmount)
        self.addSubview(surplusAmount)
        self.addSubview(joiner)
        self.addSubview(project)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
