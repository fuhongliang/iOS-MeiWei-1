//
//  HomeViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyJSON
import SnapKit
import LLCycleScrollView

class HomeViewController: UIViewController ,NibloadProtocol,LLCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,SectionHeaderViewDelegate,CLLocationManagerDelegate{
    
    //轮播
    var bannerArr = NSArray()
    //轮播图URLarr
    var bannerImgUrlArr = NSArray()
    //分类
    var sortArr = NSArray()
    //优惠
    var discountArr = NSArray()
    //商家
    var storelistArr = NSArray()
    
    let locationMana:CLLocationManager = CLLocationManager();
    
    var currLocation:CLLocation = CLLocation()
    
    var longitudeStr:String = String()
    
    var latitudeStr:String = String()
    //获取分类上一个按钮
    var tempBtn = UIButton()
    //
    var sectionView = SectionHeaderView.loadNib()
    
    var mainTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        createUI()
        //设置定位服务管理器代理
        locationMana.delegate = self
        //iOS8.0以上才可以使用
        if(UIDevice.current.systemVersion >= "8.0"){
            //始终允许访问位置信息
            locationMana.requestAlwaysAuthorization()
            //使用应用程序期间允许访问位置数据
            locationMana.requestWhenInUseAuthorization()
        }
        //设置定位进度
        locationMana.desiredAccuracy = kCLLocationAccuracyBest
        
        if CLLocationManager.locationServicesEnabled(){
            // 开启定位服务
            locationMana.startUpdatingLocation()
        }else{
            print("没有定位服务")
        }

        loadData(longitudeStr: longitudeStr, latitudeStr: latitudeStr, type: "1")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    //加载首页数据
    func loadData(longitudeStr:String, latitudeStr:String, type:String) {
        FAPIService.shared.request(.home_page(longitude: "35.9779945843", dimension: "103.9086708593", type: type), { (Data) in
//            print("首页数据\(Data)")
            let data = Data["data"] as? NSDictionary
            self.bannerArr = (data?["banner_data"] as? NSArray)!
            for i in 0..<self.bannerArr.count{
                let dict:NSDictionary = self.bannerArr[i] as! NSDictionary
                let str = String("\(image_path)\(dict["image_name"] ?? "")")
                self.bannerImgUrlArr.adding(str)
            }
            self.sortArr = (data?["gcsort_data"] as? NSArray)!
            self.discountArr = (data?["discount_data"] as? NSArray)!
            self.storelistArr = (data?["storelist_data"] as? NSArray)!
            self.createUI()
            self.mainTableView.reloadData()
        }) { (FAPIErrorModel) in
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currLocation = locations.last!
        let latitude = currLocation.coordinate.latitude
        let longitude = currLocation.coordinate.longitude
        latitudeStr = String(latitude)
        longitudeStr = String(longitude)
        print("经度------\(latitudeStr)纬度------\(longitudeStr)")
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(currLocation) { (placemarks, error) in
            if placemarks != nil{
                if((placemarks?.count)! > 0){
                    let placeMark = placemarks?.first
                    if let currentCity = placeMark?.locality {
                        print("=============\(currentCity)")
                    }
                    print(placeMark?.country ?? "")
                    print(placeMark?.thoroughfare ?? "")
                    print(placeMark?.name ?? "")
                    print(placeMark?.subLocality ?? "")

                }else if (error == nil && placemarks?.count == 0){
                    print("没有地址返回");
                }
                else if ((error) != nil){
                    print("location error\(String(describing: error))");
                }
            }
        }
        
    }

    func createUI() {
        
        /**
            headerview
            轮播图，分类，优惠专区放在headerview上面，将整个headerview当作tableview的headerview
        */
        let headerBgView = UIView()
        headerBgView.frame = CGRect(x: 0, y: 0, width: Screen_W, height: 476)
        
        //地址 图标
        let addressIcon = UIImageView()
        addressIcon.image = UIImage.init(imageLiteralResourceName: "center_ic_shdz")
        view.addSubview(addressIcon)
        
        //顶部地点按钮
        let addressBtn = UIButton()
        addressBtn.setTitle("深圳市海关大厦", for: UIControl.State.normal)
        addressBtn.setTitleColor(UIColor.hexColor(0x333333), for: UIControl.State.normal)
        addressBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        addressBtn.addTarget(self, action: #selector(click), for: UIControl.Event.touchUpInside)
        view.addSubview(addressBtn)
        
        //展开按钮
        let explandIcon = UIImageView()
        explandIcon.image = UIImage.init(imageLiteralResourceName: "icon_ic_xiala")
        view.addSubview(explandIcon)
        
        //消息图标
        let message = UIButton()
        message.setImage(UIImage.init(imageLiteralResourceName: "top_ic_xxx"), for: UIControl.State.normal)
        message.addTarget(self, action: #selector(goMessage), for: UIControl.Event.touchUpInside)
        view.addSubview(message)
        
        //搜索框
        let searchBtn = UIButton()
        searchBtn.setImage(UIImage.init(imageLiteralResourceName: "icon_sousuo"), for: UIControl.State.normal)
        searchBtn.setTitle("输入商家/商品名称", for: UIControl.State.normal)
        searchBtn.setTitleColor(UIColor.hexColor(0x999999), for: UIControl.State.normal)
        searchBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        searchBtn.backgroundColor = UIColor.hexColor(0xF2F2F2)
        searchBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        view.addSubview(searchBtn)
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib.init(nibName: "StoreTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "StoreTableViewCell")
        mainTableView.rowHeight = UITableView.automaticDimension
        view.addSubview(mainTableView)
        mainTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        mainTableView.tableFooterView = UIView.init()
        
        //轮播图,自定义样式
        let bannerView = LLCycleScrollView()
        // 是否自动滚动
        bannerView.autoScroll = true
        // 是否无限循环，此属性修改了就不存在轮播的意义了 😄
        bannerView.infiniteLoop = true
        // 滚动间隔时间(默认为2秒)
        bannerView.autoScrollTimeInterval = 3.0
        // 设置滚动方向（ vertical || horizontal ）
        bannerView.scrollDirection = .horizontal
        // 设置.system系统的UIPageControl当前显示的颜色
        bannerView.pageControlCurrentPageColor = UIColor.white
        // 模拟网络图片获取
        bannerView.imagePaths = self.bannerImgUrlArr as! Array<String>
        bannerView.delegate = self
        headerBgView.addSubview(bannerView)
        
        //分类
//        let titleArr = ["美食","饮料","正餐","水果","简餐","小吃","夜宵","龙虾","简餐","小吃","夜宵","全部分类"]
        let imgArr = ["home_ic_meishi","home_ic_yinliao","home_ic_zc","home_ic_shuiguo","home_ic_jianc","home_ic_xiaochi","home_ic_yexiao","home_ic_qbfl","home_ic_jianc","home_ic_xiaochi","home_ic_yexiao","home_ic_qbfl"]
        
        let catergoryScroll = UIScrollView()
        if self.sortArr.count%2 == 0{
            catergoryScroll.contentSize = CGSize(width: self.sortArr.count/2*100+8-46, height: 162) // ContentSize属性
        }else{
            catergoryScroll.contentSize = CGSize(width: (self.sortArr.count/2+1)*100+8-46, height: 162) // ContentSize属性
        }
        catergoryScroll.bounces = true
        catergoryScroll.backgroundColor = .white
        headerBgView.addSubview(catergoryScroll)
        
        //优惠专区
        let discountView:DiscountView = DiscountView.loadNib()
        discountView.setData(arr: self.discountArr)
        headerBgView.addSubview(discountView)

        addressIcon.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(Status_H+14)
            make.left.equalTo(view.snp.left).offset(16)
            make.width.equalTo(14)
            make.height.equalTo(18)
        }
        addressBtn.snp.makeConstraints { make in
            make.left.equalTo(addressIcon.snp.right).offset(7)
            make.centerY.equalTo(addressIcon.snp.centerY)
        }
        explandIcon.snp.makeConstraints { make in
            make.left.equalTo(addressBtn.snp.right).offset(6)
            make.centerY.equalTo(addressIcon.snp.centerY)
            make.width.equalTo(8)
            make.height.equalTo(5)
        }
        message.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).offset(-15)
            make.centerY.equalTo(addressIcon.snp.centerY)
            make.width.equalTo(18)
            make.height.equalTo(18)
        }
        searchBtn.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).offset(-15)
            make.top.equalTo(addressBtn.snp.bottom).offset(19)
            make.left.equalTo(view.snp.left).offset(15)
            make.height.equalTo(33)
        }
        
        mainTableView.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right)
            make.top.equalTo(searchBtn.snp.bottom).offset(10)
            make.left.equalTo(view.snp.left)
            make.bottom.equalTo(view.snp.bottom)
        }

        bannerView.snp.makeConstraints { make in
            make.right.equalTo(headerBgView.snp.right).offset(-15)
            make.top.equalTo(headerBgView.snp.top).offset(0)
            make.left.equalTo(headerBgView.snp.left).offset(15)
            make.height.equalTo(130)
        }
        catergoryScroll.snp.makeConstraints { make in
            make.right.equalTo(headerBgView.snp.right).offset(-15)
            make.top.equalTo(bannerView.snp.bottom).offset(0)
            make.left.equalTo(headerBgView.snp.left).offset(15)
            make.height.equalTo(162)
        }
        discountView.snp.makeConstraints { make in
            make.right.equalTo(headerBgView.snp.right).offset(0)
            make.top.equalTo(catergoryScroll.snp.bottom).offset(5)
            make.left.equalTo(headerBgView.snp.left).offset(0)
            make.height.equalTo(167)
        }

        for i in 0..<self.sortArr.count{
            let dict:NSDictionary = self.sortArr[i] as! NSDictionary
            let btn = UIButton()
            btn.setImage(UIImage.init(imageLiteralResourceName: imgArr[i]), for: UIControl.State.normal)
            catergoryScroll.addSubview(btn)
            let label = UILabel()
            label.text = dict["gc_name"] as? String
            label.textColor = UIColor.hexColor(0x333333)
            label.font = UIFont.systemFont(ofSize: 12)
            catergoryScroll.addSubview(label)
            
            if i%2 == 0{
                if i == 0{
                    btn.snp.makeConstraints { make in
                        make.top.equalTo(catergoryScroll.snp.top).offset(15)
                        make.left.equalTo(catergoryScroll.snp.left).offset(0)
                        make.height.equalTo(40)
                        make.width.equalTo(40)
                    }
                    label.snp.makeConstraints { make in
                        make.top.equalTo(btn.snp.bottom).offset(4)
                        make.centerX.equalTo(btn.snp.centerX)
                    }
                }else{
                    btn.snp.makeConstraints { make in
                        make.top.equalTo(catergoryScroll.snp.top).offset(15)
                        make.left.equalTo(tempBtn.snp.right).offset(60)
                        make.height.equalTo(40)
                        make.width.equalTo(40)
                    }
                    label.snp.makeConstraints { make in
                        make.top.equalTo(btn.snp.bottom).offset(4)
                        make.centerX.equalTo(btn.snp.centerX)
                    }
                }
                
            }else{
                if i == 1{
                    btn.snp.makeConstraints { make in
                        make.top.equalTo(tempBtn.snp.bottom).offset(34)
                        make.left.equalTo(tempBtn.snp.left).offset(0)
                        make.height.equalTo(40)
                        make.width.equalTo(40)
                    }
                    label.snp.makeConstraints { make in
                        make.top.equalTo(btn.snp.bottom).offset(4)
                        make.centerX.equalTo(btn.snp.centerX)
                    }
                }else{
                    btn.snp.makeConstraints { make in
                        make.top.equalTo(tempBtn.snp.bottom).offset(34)
                        make.left.equalTo(tempBtn.snp.left).offset(0)
                        make.height.equalTo(40)
                        make.width.equalTo(40)
                    }
                    label.snp.makeConstraints { make in
                        make.top.equalTo(btn.snp.bottom).offset(4)
                        make.centerX.equalTo(btn.snp.centerX)
                    }
                }
                
            }
            tempBtn = btn
        }

        mainTableView.tableHeaderView = headerBgView
    }
    
    //点击轮播图回调
    func cycleScrollView(_ cycleScrollView: LLCycleScrollView, didSelectItemIndex index: NSInteger) {
        print("当前图片%d",index)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 85
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        sectionView.frame = CGRect(x: 0, y: 0, width: Screen_W, height: 85)
        sectionView.delegate = self
        return sectionView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.storelistArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:StoreTableViewCell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell", for: indexPath) as! StoreTableViewCell
        let dict:NSDictionary = self.storelistArr[indexPath.row] as! NSDictionary
        cell.setData(dict: dict)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let store = StoreViewController()
        self.navigationController?.pushViewController(store, animated: true)
    }
    
    func comment() {
        print("综合评价")
        setUpColor(arr: [UIColor.hexColor(0x000000),UIColor.hexColor(0x999999),UIColor.hexColor(0x999999),UIColor.hexColor(0x999999)])
        setUpFont(arr: [UIFont.systemFont(ofSize: 16),UIFont.systemFont(ofSize: 14),UIFont.systemFont(ofSize: 14),UIFont.systemFont(ofSize: 14)])
        loadData(longitudeStr: longitudeStr, latitudeStr: latitudeStr, type: "1")
    }
    
    func sales() {
        print("销量最多")
        setUpColor(arr: [UIColor.hexColor(0x999999),UIColor.hexColor(0x999999),UIColor.hexColor(0x000000),UIColor.hexColor(0x999999)])
        setUpFont(arr: [UIFont.systemFont(ofSize: 14),UIFont.systemFont(ofSize: 14),UIFont.systemFont(ofSize: 16),UIFont.systemFont(ofSize: 14)])
        loadData(longitudeStr: longitudeStr, latitudeStr: latitudeStr, type: "2")
    }
    
    func distance() {
        print("距离最近")
        setUpColor(arr: [UIColor.hexColor(0x999999),UIColor.hexColor(0x000000),UIColor.hexColor(0x999999),UIColor.hexColor(0x999999)])
        setUpFont(arr: [UIFont.systemFont(ofSize: 14),UIFont.systemFont(ofSize: 16),UIFont.systemFont(ofSize: 14),UIFont.systemFont(ofSize: 14)])
        loadData(longitudeStr: longitudeStr, latitudeStr: latitudeStr, type: "3")
    }
    
    func mostGoodsComments() {
        print("好评最多")
        setUpColor(arr: [UIColor.hexColor(0x999999),UIColor.hexColor(0x999999),UIColor.hexColor(0x999999),UIColor.hexColor(0x000000)])
        setUpFont(arr: [UIFont.systemFont(ofSize: 14),UIFont.systemFont(ofSize: 14),UIFont.systemFont(ofSize: 14),UIFont.systemFont(ofSize: 16)])
        loadData(longitudeStr: longitudeStr, latitudeStr: latitudeStr, type: "4")
    }
    
    //设置标题字体颜色
    func setUpColor(arr:Array<Any>){
        sectionView.commentBtn.setTitleColor(arr[0] as? UIColor, for: UIControl.State.normal)
        sectionView.distanceBtn.setTitleColor(arr[1] as? UIColor, for: UIControl.State.normal)
        sectionView.salesNumberBtn.setTitleColor(arr[2] as? UIColor, for: UIControl.State.normal)
        sectionView.mostGoodsCommetsBtn.setTitleColor(arr[3] as? UIColor, for: UIControl.State.normal)
    }
    
    //设置标题字体大小
    func setUpFont(arr:Array<Any>){
        sectionView.commentBtn.titleLabel?.font = arr[0] as? UIFont
        sectionView.distanceBtn.titleLabel?.font = arr[1] as? UIFont
        sectionView.salesNumberBtn.titleLabel?.font = arr[2] as? UIFont
        sectionView.mostGoodsCommetsBtn.titleLabel?.font = arr[3] as? UIFont
    }
    
    //选择位置
    @objc func click(){
        let vc = ChooseAddressViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //购物车
    @objc func goMessage() {
        let vc = ShoppingCartViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

