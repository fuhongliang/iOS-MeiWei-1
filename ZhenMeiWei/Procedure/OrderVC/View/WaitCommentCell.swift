//
//  WaitCommentCell.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/22.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class WaitCommentCell: UITableViewCell {

    @IBOutlet weak var leftBtn: UIButton!
    
    @IBOutlet weak var rightBtn: UIButton!
    
    @IBOutlet weak var orderState: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setDataWithModel(data:NSDictionary) {
        let str:String = data["state"] as!String
        
        if str == "已退款" {
            self.orderState.text = "退款成功"
            self.orderState.textColor = UIColor.hexColor(0x45ACFF)
            self.leftBtn.setTitle("逛逛别家", for: UIControl.State.normal)
            self.rightBtn.setTitle("退款详情", for: UIControl.State.normal)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
