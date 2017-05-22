//
//  ExtensionUIColor.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/22.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public func colorWithHex(rgb:Int, alpha: CGFloat) -> UIColor {
        
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgb & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgb & 0xFF)) / 255.0, alpha: alpha)        
    }
}

