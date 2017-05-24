//
//  XSInvestSecHeaderView.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/19.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit
import Foundation

class XSInvestSecHeaderView: UITableViewHeaderFooterView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor.white
        
        let bgView = UIView.init(frame: CGRect.init(x: 0, y: 5, width: kDeviceWidth, height: 40))
        
        let moreIcon = UIImageView(frame: CGRect.init(x: kDeviceWidth - 7 - 10, y: 16, width: 7, height: 12))
        moreIcon.image = UIImage(named: "right_arrow")

        let label = UILabel(frame: CGRect.init(x: 10, y: 0, width: kDeviceWidth - moreIcon.frame.size.width - 20, height: 40))
        label.text = "hello section";
    
        contentView.addSubview(bgView)
        bgView.addSubview(moreIcon)
        bgView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
