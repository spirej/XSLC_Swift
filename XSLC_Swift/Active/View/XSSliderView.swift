//
//  XSSliderView.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/6/1.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

class XSSliderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let ITEMWIDTH = 61
    
    var scrollView: UIScrollView!
    var itemsArr: Array<String>
    var leftLayer: CAGradientLayer!
    var rightLayer: CAGradientLayer!
    
    
    init(frame: CGRect, items: Array<String>) {
        self.itemsArr = items
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        createScrollView()
        createItemBtn()
        self.layer.addSublayer(buildLeftLayer())
        self.layer.addSublayer(buildRightLayer())
    }
    
    func createScrollView() {
        scrollView = UIScrollView(frame: CGRect.init(x: 5, y: 0, width: kDeviceWidth - 10, height: self.frame.size.height))
        scrollView.backgroundColor = UIColor.white
        scrollView.contentSize = CGSize(width: itemsArr.count * ITEMWIDTH, height: 0)
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        self.addSubview(scrollView)
    }
    
    func createItemBtn() {
        for index in 0..<self.itemsArr.count {
            let btn = buildButton(rect: CGRect.init(x: index * ITEMWIDTH, y: 0, width: ITEMWIDTH, height: Int(self.frame.size.height)), bgColor: UIColor.clear, text: itemsArr[index], font: 15, textColor: UIColor.clear.colorWithHex(rgb: 0x6b6f79, alpha: 1))
            btn.setTitleColor(colorBlue, for: .selected)
            btn.addTarget(self, action: #selector(itemBtnAction(btn:)), for: .touchUpInside)
            scrollView.addSubview(btn)
        }
    }
    
    func buildLeftLayer() -> CAGradientLayer {
        leftLayer = CAGradientLayer()
        leftLayer.frame = CGRect.init(x: 5, y: 0, width: 50, height: self.frame.size.height)
        leftLayer.colors = [UIColor.white.cgColor, UIColor.clear.colorWithHex(rgb: 0xffffff, alpha: 0.01).cgColor]
        leftLayer.startPoint = CGPoint(x: 0, y: 0.5)
        leftLayer.endPoint = CGPoint(x: 1, y: 0.5)
        leftLayer.isHidden = true
        return leftLayer
    }
    
    func buildRightLayer() -> CAGradientLayer {
        rightLayer = CAGradientLayer()
        rightLayer.frame = CGRect(x: kDeviceWidth - 55, y: 0, width: 50, height: self.frame.size.height)
        rightLayer.colors = [UIColor.clear.colorWithHex(rgb: 0xffffff, alpha: 0.2).cgColor, UIColor.white.cgColor]
        rightLayer.startPoint = CGPoint(x: 0, y: 0.5)
        rightLayer.endPoint = CGPoint(x: 1, y: 0.5)
        return rightLayer
    }
    
    func itemBtnAction(btn: UIButton) {
        //
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
