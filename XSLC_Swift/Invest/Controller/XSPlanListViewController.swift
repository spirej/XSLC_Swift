//
//  XSPlanListViewController.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/19.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

class XSPlanListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "产品列表"
        self.view.backgroundColor = kVCBgColor
        
        let planlistTableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight), style: UITableViewStyle.plain)
        planlistTableView.register(UINib.init(nibName: "XSPlanListCell", bundle: Bundle.main), forCellReuseIdentifier: "PlanListCell")
        planlistTableView.delegate = self
        planlistTableView.dataSource = self
        planlistTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        planlistTableView.backgroundColor = UIColor.clear
        self.view .addSubview(planlistTableView)
    }
    
    // MARK: - UITableView Delegate & DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:XSPlanListCell = tableView.dequeueReusableCell(withIdentifier: "PlanListCell") as! XSPlanListCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let plandetailsVC = XSPlandetailsViewController()
        self.navigationController?.pushViewController(plandetailsVC, animated: true)
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
