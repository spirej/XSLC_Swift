//
//  XSWebViewController.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/24.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

class XSWebViewController: UIViewController {
    
    var webView: UIWebView!
    var urlStr:String!
    var navTitle:String!
    
    
    
    init(title: String, url: String) {
        super.init(nibName: nil, bundle: nil)
        navTitle = title
        urlStr = url
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = navTitle
        
        webView = UIWebView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight))
        let req = URLRequest(url: URL.init(string: urlStr)!)
        
        webView.loadRequest(req)
        self.view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
