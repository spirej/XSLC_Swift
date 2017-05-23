//
//  XSPlandetailsViewController.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/19.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

let headerH: CGFloat = 440.0
let joinViewH: CGFloat = 60.0
var planTableView: UITableView!
var planHeaderView: XSPlandetailsHeaderView!
var joinView:UIView!
var titleArray:Array<String>!
var descArray:Array<String>!

class XSPlandetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

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
    
    // MARK: - ACTION
    func join() {
        self.view.endEditing(true)
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
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //注册键盘通知
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        return true
    }
    
    func keyBoardWillShow(_ notification: Notification) {
        //获取userInfo
        let kbInfo = notification.userInfo
        //获取键盘的size
        let kbRect = (kbInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        //键盘的Y偏移量
        let kbHeight = kbRect.size.height
        //键盘弹出时间
        let duration = kbInfo?[UIKeyboardAnimationDurationUserInfoKey] as! Double
        //界面偏出动画
        UIView.animate(withDuration: duration) {
            joinView.frame = CGRect.init(x: 0, y: kDeviceHeight - joinViewH - kbHeight, width: kDeviceWidth, height: joinViewH)
        }
    }
    
    func keyBoardWillHide(_ notification: Notification) {
        let kbInfo = notification.userInfo
        let duration = kbInfo?[UIKeyboardAnimationDurationUserInfoKey] as! Double
        UIView.animate(withDuration: duration) { 
            joinView.frame = CGRect.init(x: 0, y: kDeviceHeight - joinViewH, width: kDeviceWidth, height: joinViewH)
        }
    }
    
    //移除通知
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - SETUI
    func setUI() {
        planHeaderView = XSPlandetailsHeaderView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: headerH))
        
        planTableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight - joinViewH), style: .plain)
        planTableView.register(UINib.init(nibName: "XSPlandetailsCell", bundle: Bundle.main), forCellReuseIdentifier: "PlandetailsCell")
        planTableView.delegate = self
        planTableView.dataSource = self
        planTableView.tableHeaderView = planHeaderView
        planTableView.backgroundColor = UIColor.clear
        planTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        joinView = buildView(rect: CGRect.init(x: 0, y: kDeviceHeight - joinViewH, width: kDeviceWidth, height: joinViewH), color: UIColor.white)
        
        let line = buildView(rect: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: 0.6), color: colorGrayLine)
        
        let joinAmountTF = UITextField(frame: CGRect.init(x: 5, y: 5, width: kDeviceWidth - 150, height: 50))
        joinAmountTF.placeholder = "XXX元起投"
        joinAmountTF.keyboardType = UIKeyboardType.numberPad
        joinAmountTF.borderStyle = .roundedRect
        joinAmountTF.delegate = self
//        joinAmountTF.leftViewMode = .always
//        joinAmountTF.leftViewRect(forBounds: CGRect.init(x: 0, y: 0, width: 10, height: 50))
        
        let joinBT = buildButton(rect: CGRect.init(x: joinAmountTF.maxX + 5, y: 5, width: 135, height: 50), bgColor: UIColor.clear.colorWithHex(rgb: 0x52adff, alpha: 1), text: "立即加入", font: 15, textColor: UIColor.white)
        joinBT.layer.cornerRadius = 3
        joinBT.addTarget(self, action: #selector(join), for: .touchUpInside)
        
        joinView.addSubview(line)
        joinView.addSubview(joinAmountTF)
        joinView.addSubview(joinBT)
        
        self.view.addSubview(planTableView)
        self.view.addSubview(joinView)
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
