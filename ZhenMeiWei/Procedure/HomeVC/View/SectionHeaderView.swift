//
//  SectionHeaderView.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

protocol SectionHeaderViewDelegate:NSObjectProtocol {
    
    func comment()
    func sales()
    func distance()
    func mostGoodsComments()
    
}
class SectionHeaderView: UIView ,NibloadProtocol{
    
    weak var delegate:SectionHeaderViewDelegate?
    
    //综合评价按钮
    @IBOutlet weak var commentBtn: UIButton!
    //销量最高按钮
    @IBOutlet weak var salesNumberBtn: UIButton!
    //距离最近按钮
    @IBOutlet weak var distanceBtn: UIButton!
    //好评最多按钮
    @IBOutlet weak var mostGoodsCommetsBtn: UIButton!
    //按钮下面滑动色块
    @IBOutlet weak var lineView: UIView!
    
    @IBAction func commentAction(_ sender: Any) {
        lineView.center.x = commentBtn.center.x
        if delegate != nil{
            delegate?.comment()
        }
    }
    @IBAction func mostSalesAction(_ sender: Any) {
        lineView.center.x = salesNumberBtn.center.x
        if delegate != nil{
            delegate?.sales()
        }
    }
    @IBAction func distanceAction(_ sender: Any) {
        lineView.center.x = distanceBtn.center.x
        if delegate != nil{
            delegate?.distance()
        }
    }
    @IBAction func mostGoodsCommentAction(_ sender: Any) {
        lineView.center.x = mostGoodsCommetsBtn.center.x
        if delegate != nil{
            delegate?.mostGoodsComments()
        }
    }
    
}
