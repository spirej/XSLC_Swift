//
//  XSPlandetailsViewController.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/19.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

let headerH: CGFloat = 440.0
var planTableView: UITableView!
var planHeaderView: XSPlandetailsHeaderView!
var titleArray:Array<String>!
var descArray:Array<String>!

class XSPlandetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "详情"
        self.view.backgroundColor = kVCBgColor
        
        // 假数据
        titleArray = ["会员专享", "计划奖励", "计息方式", "理财期限", "回款方式", "加入手续费"]
        descArray = ["VIP3及以上会员专享", "成功加入计划后，将有50%概率获得加息", "当天起息", "365天（2018年05月21日到期）", "到期本息", "无"]
        
        setUI()
    }
    
    // MARK: - UITableViewDelegate & DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: XSPlandetailsCell = tableView.dequeueReusableCell(withIdentifier: "PlandetailsCell") as! XSPlandetailsCell
        cell.icon.image = UIImage(named: "icon\(indexPath.row)")
        cell.title.text = titleArray[indexPath.row]
        cell.desc.text = descArray[indexPath.row]
        return cell
    }
    
    // MARK: - SETUI
    func setUI() {
        planHeaderView = XSPlandetailsHeaderView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: headerH))
        
        planTableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight), style: .plain)
        planTableView.register(UINib.init(nibName: "XSPlandetailsCell", bundle: Bundle.main), forCellReuseIdentifier: "PlandetailsCell")
        planTableView.delegate = self
        planTableView.dataSource = self
        planTableView.tableHeaderView = planHeaderView
        planTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        self.view.addSubview(planTableView)
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
