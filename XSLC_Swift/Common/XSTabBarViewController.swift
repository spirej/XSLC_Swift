//
//  XSTabBarViewController.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/17.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

class XSTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let homeVC = XSHomeViewController()
        let investVC = XSInvestViewController()
        let discoverVC = XSDiscoverViewController()
        let activeVC = XSActiveViewController()
        let mineVC = XSMineViewController()
        
        self.addChildViewController(tabInit(tabbarVC: homeVC, title: "首页", normeImg: "tabbar_discover_normal", selectImg: "tabbar_home_select"))
        self.addChildViewController(tabInit(tabbarVC: investVC, title: "理财", normeImg: "tabbar_invest_normal", selectImg: "tabbar_invest_select"))
        self.addChildViewController(tabInit(tabbarVC: discoverVC, title: "发现", normeImg: "tabbar_discover_normal", selectImg: "tabbar_discover_select"))
        self.addChildViewController(tabInit(tabbarVC: activeVC, title: "动态", normeImg: "tabbar_active_normal", selectImg: "tabbar_active_select"))
        self.addChildViewController(tabInit(tabbarVC: mineVC, title: "我的", normeImg: "tabbar_mine_normal", selectImg: "tabbar_mine_select"))
        
    }
    
    func tabInit(tabbarVC:UIViewController, title:String, normeImg:String, selectImg:String) -> UINavigationController {
        tabbarVC.tabBarItem.image = UIImage(named: normeImg)
        tabbarVC.tabBarItem.selectedImage = UIImage(named: selectImg)
        tabbarVC.tabBarItem.title = title
        let nav = UINavigationController(rootViewController: tabbarVC)
        return nav
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
