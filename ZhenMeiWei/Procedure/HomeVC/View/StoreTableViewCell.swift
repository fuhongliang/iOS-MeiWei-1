//
//  StoreTableViewCell.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/17.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell ,NibloadProtocol{
    
    //商家图片
    @IBOutlet weak var storeImage: UIImageView!
    //商家名称
    @IBOutlet weak var storeName: UILabel!
    /**
     商家评分星星、star1-star5、
     */
    @IBOutlet weak var star1: UIImageView!
    
    @IBOutlet weak var star2: UIImageView!
    
    @IBOutlet weak var star3: UIImageView!
    
    @IBOutlet weak var star4: UIImageView!
    
    @IBOutlet weak var star5: UIImageView!
    
    //每月销量
    @IBOutlet weak var salesNumber: UILabel!
    //商家距离
    @IBOutlet weak var distance: UILabel!
    //时间
    @IBOutlet weak var time: UILabel!
    //起送价格
    @IBOutlet weak var startLimitPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setData(dict:NSDictionary) {
        self.storeName.text = dict["store_name"] as? String
        let url = URL(string: "\(image_path)\(dict["store_avatar"] ?? "")")
        self.storeImage.kf.setImage(with: url!, placeholder: UIImage.init(imageLiteralResourceName: "center_touxiang"), options: nil, progressBlock: nil, completionHandler: nil)
        self.salesNumber.text = "月售\(dict["store_sales"] ?? "")"
    }
    
}
