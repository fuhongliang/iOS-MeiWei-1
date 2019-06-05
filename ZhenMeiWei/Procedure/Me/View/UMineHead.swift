//
//  UMineHead.swift
//  ZhenMeiWei
//
//  Created by KevinFu on 2019/5/21.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class UMineHead: UIView {
    
    private lazy var bgView: UIImageView = {
        let bw = UIImageView()
        bw.contentMode = .scaleAspectFill
        return bw
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        addSubview(bgView)
        bgView.snp.makeConstraints {$0.edges.equalToSuperview() }
        sexTypeDidChange()
    }
    
    @objc func sexTypeDidChange() {
        bgView.image = UIImage(named: "blooming")
    }
}
