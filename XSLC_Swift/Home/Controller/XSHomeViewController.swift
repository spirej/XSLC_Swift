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

class XSHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    var headerView: UIView!
    var quickBuyView: UIView!
    var whiteTakeView: UIView!
    var homeTableView: UITableView!
    var quickbuyItem: UICollectionView!
    var whiteTakeItem: UICollectionView!
    var bannerView: LLCycleScrollView!
    var itemsView: XSHomeItemsView!
    
    let bannerH:CGFloat = 200
    let itemsViewH:CGFloat = 105
    let quickBuyH:CGFloat = 140
    let whiteTakeH:CGFloat = 256
    let space:CGFloat = 5
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "首页"
        self.view.backgroundColor = kVCBgColor
        setUI()
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let plandetailsVC = XSPlandetailsViewController()
        plandetailsVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(plandetailsVC, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:XSPlanListCell = tableView.dequeueReusableCell(withIdentifier: "PlanListCell") as! XSPlanListCell
        return cell
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == quickbuyItem {
            return 4
        }else if collectionView == whiteTakeItem {
            return 12
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == quickbuyItem {
            return CGSize(width: 150, height: 80)
        } else if collectionView == whiteTakeItem {
            return CGSize(width: 150, height: 194)
        }
        return CGSize.zero
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == quickbuyItem {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeQuickbuy", for: indexPath) as! XSHomeQuickbuyCell
            return cell
        } else if collectionView == whiteTakeItem {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeWhiteTake", for: indexPath) as! XSHomeWhiteTakeCell
            cell.icon.sd_setImage(with: URL.init(string: whiteTakeIcon[indexPath.row]))
            return cell
        }
        return UICollectionViewCell()
    }
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let planListVC = XSPlanListViewController()
        planListVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(planListVC, animated: true)
    }
    
    // MARK: - SETUI
    func setUI() {
        // headerView
        headerView = UIView(frame: CGRect.init(x: 0, y: kNavigationBarHeight, width: kDeviceWidth, height: bannerH + itemsViewH + quickBuyH + space))
        
        // banner
        let titles = [""];
        bannerView = LLCycleScrollView.llCycleScrollViewWithFrame(CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: 200), imageURLPaths: imageUrlStrs, titles: titles, didSelectItemAtIndex: { (index) in
            print("当前点击图片位置：\(index)")
            let url = targetUrl[index]
            let webVC = XSWebViewController(title: "", url: url)
            webVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(webVC, animated: true)
        })
        
        // itemsView
        itemsView = XSHomeItemsView(frame: CGRect.init(x: 0, y: bannerView.maxY, width: kDeviceWidth, height: 105))
        
        // qucikBuy
        buildQuickbuyView()
        
        // whiteTake
        buildWhiteTakeView()
        
        // tableView
        homeTableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight), style: .plain)
        homeTableView.register(UINib.init(nibName: "XSPlanListCell", bundle: nil), forCellReuseIdentifier: "PlanListCell")
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.tableHeaderView = headerView
        homeTableView.tableFooterView = whiteTakeView
        homeTableView.backgroundColor = UIColor.clear
        homeTableView.separatorStyle = .none
        
        headerView.addSubview(bannerView)
        headerView.addSubview(itemsView)
        headerView.addSubview(quickBuyView)
        self.view.addSubview(homeTableView)
    }
    
    func buildQuickbuyView() {
        quickBuyView = UIView(frame: CGRect.init(x: 0, y: itemsView.maxY + space, width: kDeviceWidth, height: quickBuyH))
        quickBuyView.backgroundColor = UIColor.white
        
        let title = buildLabel(rect: CGRect.init(x: 10, y: 15, width: kDeviceWidth - 10, height: 16), labelColor: UIColor.clear, text: "快速投资", textColor: colorBlack, fontSize: 16, align: .left)
        title.font = UIFont.boldSystemFont(ofSize: 16)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        
        quickbuyItem = UICollectionView(frame: CGRect.init(x: 0, y: title.maxY + 15, width: kDeviceWidth, height: 80), collectionViewLayout: flowLayout)
        quickbuyItem.register(UINib.init(nibName: "XSHomeQuickbuyCell", bundle: nil), forCellWithReuseIdentifier: "HomeQuickbuy")
        quickbuyItem.delegate = self
        quickbuyItem.dataSource = self
        quickbuyItem.backgroundColor = UIColor.clear
        quickbuyItem.showsHorizontalScrollIndicator = false
        quickbuyItem.showsVerticalScrollIndicator = false
        
        quickBuyView.addSubview(title)
        quickBuyView.addSubview(quickbuyItem)
    }
    
    func buildWhiteTakeView() {
        whiteTakeView = buildView(rect: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: whiteTakeH), color: UIColor.clear)
        let bgView = buildView(rect: CGRect.init(x: 0, y: space, width: kDeviceWidth, height: whiteTakeH - space), color: UIColor.white)
        
        let title = buildLabel(rect: CGRect.init(x: 10, y: 15, width: kDeviceWidth - 10, height: 16), labelColor: UIColor.clear, text: "收益前置 好物白拿", textColor: colorBlack, fontSize: 16, align: .left)
        title.font = UIFont.boldSystemFont(ofSize: 16)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        
        whiteTakeItem = UICollectionView(frame: CGRect.init(x: 0, y: title.maxY + 15, width: kDeviceWidth, height: 194), collectionViewLayout: flowLayout)
        whiteTakeItem.register(UINib.init(nibName: "XSHomeWhiteTakeCell", bundle: nil), forCellWithReuseIdentifier: "HomeWhiteTake")
        whiteTakeItem.delegate = self
        whiteTakeItem.dataSource = self
        whiteTakeItem.backgroundColor = UIColor.clear
        whiteTakeItem.showsHorizontalScrollIndicator = false
        whiteTakeItem.showsVerticalScrollIndicator = false
        
        bgView.addSubview(title)
        bgView.addSubview(whiteTakeItem)
        whiteTakeView.addSubview(bgView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
