//
//  XSMineHeaderView.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/23.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

class XSMineHeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
//    var contentView:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView = loadFromNib()
        
//        let view = XSMineHeaderView.viewFromXIB() as! XSMineHeaderView
        
//        addSubview(view)
    }
    
//    func loadFromNib() -> XSMineHeaderView {
//        return Bundle.main.loadNibNamed("XSMineHeaderView", owner: nil, options: nil)?.first as! XSMineHeaderView
//    }
    
//    func loadViewFromNib() -> UIView {
//        let className = type(of: self)
//        let bundle = Bundle(for: className)
//        let name = NSStringFromClass(className).components(separatedBy: ".").last
//        let nib = UINib(nibName: name!, bundle: bundle)
//        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
//        return view
//    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        contentView = loadFromNib()
//        addSubview(contentView)
        fatalError("init(coder:) has not been implemented")
    }
}
