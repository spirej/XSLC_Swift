//
//  XSHomeQuickbuyCell.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/26.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

class XSHomeQuickbuyCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.layer.borderWidth = 0.6
        bgView.layer.borderColor = colorGrayLine.cgColor
    }

}
