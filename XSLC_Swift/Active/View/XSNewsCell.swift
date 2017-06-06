//
//  XSNewsCell.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/6/6.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

class XSNewsCell: UITableViewCell {

    @IBOutlet weak var whiteView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        whiteView.layer.borderColor = colorGrayLine.cgColor
        whiteView.layer.borderWidth = 0.6
        whiteView.layer.cornerRadius = 4
        whiteView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
