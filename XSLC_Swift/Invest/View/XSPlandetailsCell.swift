//
//  XSPlandetailsCell.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/22.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

class XSPlandetailsCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var line: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
