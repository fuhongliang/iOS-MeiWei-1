//
//  UBaseTableViewCell.swift
//  ZhenMeiWei
//
//  Created by KevinFu on 2019/5/21.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Reusable

class UBaseTableViewCell: UITableViewCell, Reusable {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configUI() {}
    
}
