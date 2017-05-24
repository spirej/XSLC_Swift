//
//  XSMineViewController.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/17.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

class XSMineViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let itemsCount = 14
    let headH:CGFloat = 265
    let itemH:CGFloat = 80
    private var collectView: UICollectionView!
    private var titleArray:Array<String>!
    private var descArray:Array<String>!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "我的"
        self.view.backgroundColor = kVCBgColor
        // 假数据
        titleArray = ["向上计划", "工资理财", "散标投资", "债权转让", "定期还款", "风险评测", "还车贷", "还房贷", "加油卡", "体验金", "会员中心", "向大侠", "好物白拿", "资金记录"]
        descArray = ["已加入项目5", "已加入项目3", "已加入项目10", "已加入项目7", "已加入项目0", "", "", "", "9张", "88888元", "积分：10986", "66", "", "+8100000"]
        setUI()
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsCount
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MineCollectionCell", for: indexPath) as! XSMineCollectionCell
        cell.icon.image = UIImage(named: "mIcon\(indexPath.row)")
        cell.title.text = titleArray[indexPath.row]
        cell.desc.text = descArray[indexPath.row]
        return cell
    }
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (kDeviceWidth-1)/2.0, height: itemH)
    }
    // MARK: - SETUI
    func setUI() {
        //scrollView
        let scrollView = UIScrollView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight))
        scrollView.contentSize = CGSize(width: kDeviceWidth, height: headH + CGFloat(itemsCount)/2 * itemH)
        
        //header
        let headerView = XSMineHeaderView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: 265))
        
        //collectionView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectView = UICollectionView(frame: CGRect.init(x: 0, y: 265, width: kDeviceWidth, height: CGFloat(itemsCount)/2 * itemH), collectionViewLayout: layout)
        collectView.delegate = self
        collectView.dataSource = self
        collectView.backgroundColor = UIColor.clear
        collectView.isScrollEnabled = false
        collectView.register(UINib.init(nibName: "XSMineCollectionCell", bundle: nil), forCellWithReuseIdentifier: "MineCollectionCell")
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(headerView)
        scrollView.addSubview(collectView)
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
