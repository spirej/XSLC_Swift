//
//  XSDiscoverView.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/6/6.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

class XSDiscoverView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var contentView:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView = loadFromNib()
        addSubview(contentView)
    }
    
    func loadFromNib() -> UIView {
        return Bundle.main.loadNibNamed("XSDiscoverView", owner: nil, options: nil)?.first as! UIView
    }
    
    override func layoutSubviews() {
        contentView.frame = bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

}
