//
//  XSHomeViewController.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/17.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit
import SDWebImage
import LLCycleScrollView

class XSHomeViewController: UIViewController {

    var bannerView: LLCycleScrollView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "首页"
        setUI()
    }
    
    // MARK: - SETUI
    func setUI() {
        let titles = [""];
        bannerView = LLCycleScrollView.llCycleScrollViewWithFrame(CGRect.init(x: 0, y: kNavigationBarHeight, width: kDeviceWidth, height: 200), imageURLPaths: imageUrlStrs, titles: titles, didSelectItemAtIndex: { (index) in
            print("当前点击图片位置：\(index)")
            let url = targetUrl[index]
            let webVC = XSWebViewController(title: "", url: url)
            webVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(webVC, animated: true)
        })
        
        self.view.addSubview(bannerView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
