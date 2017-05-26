//
//  XSHomeWhiteTakeCell.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/26.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

class XSHomeWhiteTakeCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.layer.borderWidth = 0.6
        bgView.layer.borderColor = colorGrayLine.cgColor
    }

}
