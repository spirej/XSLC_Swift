//
//  XSInvestViewController.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/17.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

let headHeight:CGFloat = 120.0
let IDENTIFY = "CELLIDENTIFY"
let IDHEADER = "HEADERIDENTIFY"


class XSInvestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "理财"
        self.setUI()
    }
    
    // MARK: - ACTION
    func secHeaderClick() {
        let planListVC = XSPlanListViewController()
        planListVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(planListVC, animated: true)
    }
    
    // MARK: - UITableView Delegate & DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var secHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: IDHEADER)
        if (secHeaderView == nil) {
            secHeaderView = XSInvestSecHeaderView.init(reuseIdentifier: IDHEADER)
            secHeaderView?.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(XSInvestViewController.secHeaderClick)))
            secHeaderView?.isUserInteractionEnabled = true
        }
        return secHeaderView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFY, for: indexPath)
        cell.textLabel?.text = "假数据 - 第\(indexPath.section)组 - 第\(indexPath.row)个"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let plandetailsVC = XSPlandetailsViewController()
        plandetailsVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(plandetailsVC, animated: true)
    }
    
    //MARK: - Set UI
    func setUI() {
        let headIcon = UIImageView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: headHeight))
        headIcon.image = UIImage(named: "investBg")
        
        
        let tableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight), style: UITableViewStyle.grouped)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: IDENTIFY)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = headIcon
        self.view.addSubview(tableView)
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
