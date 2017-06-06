//
//  XSActiveViewController.swift
//  XSLC_Swift
//
//  Created by SPIREJ on 2017/5/17.
//  Copyright © 2017年 SPIREJ. All rights reserved.
//

import UIKit

class XSActiveViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {

    let ITEMWIDTH = 61
    var sliderView: XSSliderView!
    var bottomScrollView: UIScrollView!
    var itemScrollView: UIScrollView!
    var segmentCtr: UISegmentedControl!
    var itemArr:Array<String>!
    var messageTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemArr = ["阿斯顿", "我完全", "方法", "热让", "公告", "哈哈", "尺寸", "吖吖", "宝宝", "浪了", "噢噢"]
        self.view.backgroundColor = kVCBgColor
        self.navigationItem.titleView = buildSegmentCtr()
        self.view.addSubview(buildBottomScrollView())
        bottomScrollView.addSubview(buildSliderView())
        bottomScrollView.addSubview(buildItemScrollView())
        bottomScrollView.addSubview(buildMessageTableView())
        buildItemTableView()
    }
    
    // MARK: - ACTION
    func segmentCtrClick(segment: UISegmentedControl) {
        let offsetX = kDeviceWidth * CGFloat(segment.selectedSegmentIndex)
        if self.bottomScrollView.contentOffset.x == offsetX {
            return
        }
        self.bottomScrollView.setContentOffset(CGPoint.init(x: offsetX, y: 0), animated: true)
    }
    
    // MARK: - getter
    func buildSegmentCtr() -> UISegmentedControl {
        segmentCtr = UISegmentedControl(items: ["资讯", "公告"])
        segmentCtr.frame = CGRect(x: 0, y: 0, width: 140, height: 30)
        segmentCtr.addTarget(self, action: #selector(segmentCtrClick(segment:)), for: .valueChanged)
        return segmentCtr
    }
    
    func buildBottomScrollView() -> UIScrollView {
        bottomScrollView = UIScrollView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight - 44))
        bottomScrollView.contentSize = CGSize(width: kDeviceWidth * 2, height: 0)
        bottomScrollView.isScrollEnabled = false
        bottomScrollView.delegate = self
        bottomScrollView.backgroundColor = UIColor.clear
        return bottomScrollView
    }
    
    func buildSliderView() -> XSSliderView {
        sliderView = XSSliderView(frame: CGRect.init(x: 0, y: 0, width: kDeviceWidth, height: 40), items: itemArr)
        sliderView.scrollView.delegate = self
        return sliderView
    }
    
    func buildItemScrollView() -> UIScrollView {
        itemScrollView = UIScrollView(frame: CGRect.init(x: 0, y: 40, width: kDeviceWidth, height: kDeviceHeight - 40))
        itemScrollView.contentSize = CGSize.init(width: kDeviceWidth * CGFloat(itemArr.count), height: 0)
        itemScrollView.backgroundColor = UIColor.clear
        itemScrollView.isScrollEnabled = true
        itemScrollView.isPagingEnabled = true
        itemScrollView.delegate = self
        itemScrollView.showsVerticalScrollIndicator = false
        itemScrollView.showsHorizontalScrollIndicator = false
        return itemScrollView
    }
    
    func buildMessageTableView() -> UITableView {
        messageTableView = UITableView(frame: CGRect.init(x: kDeviceWidth, y: 0, width: kDeviceWidth, height: kDeviceHeight - 64 - 50), style: .plain)
        messageTableView.backgroundColor = UIColor.clear
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.separatorStyle = .none
        messageTableView.register(UINib.init(nibName: "XSNewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        return messageTableView
    }
    
    func buildItemTableView() {
        for index in 0..<itemArr.count {
            let tableViewCtr = XSNewsTableViewController(style: .plain)
            tableViewCtr.view.frame = CGRect(x: kDeviceWidth * CGFloat(index), y: 0, width: kDeviceWidth, height: kDeviceHeight)
            self.itemScrollView.addSubview(tableViewCtr.view)
        }
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 325
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! XSNewsCell
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == sliderView.scrollView {
            var offset = scrollView.contentOffset
            offset.y = 0
            scrollView.contentOffset = offset
            
            print("\(offset.x) + \(offset.y)")
        }
        
        if scrollView == bottomScrollView {
            var offset = scrollView.contentOffset
            offset.y = -64
            scrollView.contentOffset = offset
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
