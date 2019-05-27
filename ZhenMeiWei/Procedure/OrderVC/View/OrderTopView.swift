//
//  OrderTopView.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/21.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit


protocol OrderTopViewDelegate:NSObjectProtocol {
    
    func clickAll()
    func clickWait()
    func clickRefund()
    
}
//顶部滑动按钮VIEW
class OrderTopView: UIView {

    weak var delegate:OrderTopViewDelegate?
    
    var bgView = UIView()
    
    var allOrderBtn = UIButton()
    
    var waitComment = UIButton()
    
    var refundBtn = UIButton()
    
    var bottomLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bgView.backgroundColor = UIColor.white
        self.addSubview(bgView)
        
        allOrderBtn.setTitle("全部订单", for: UIControl.State.normal)
        allOrderBtn.setTitleColor(UIColor.hexColor(0x000000), for: UIControl.State.normal)
        allOrderBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        allOrderBtn.addTarget(self, action: #selector(allOrder), for: UIControl.Event.touchUpInside)
        bgView.addSubview(allOrderBtn)
        
        waitComment.setTitle("待评论", for: UIControl.State.normal)
        waitComment.setTitleColor(UIColor.hexColor(0x666666), for: UIControl.State.normal)
        waitComment.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        waitComment.addTarget(self, action: #selector(waitOrder), for: UIControl.Event.touchUpInside)
        bgView.addSubview(waitComment)
        
        refundBtn.setTitle("退款", for: UIControl.State.normal)
        refundBtn.setTitleColor(UIColor.hexColor(0x666666), for: UIControl.State.normal)
        refundBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        refundBtn.addTarget(self, action: #selector(refundOrder), for: UIControl.Event.touchUpInside)
        bgView.addSubview(refundBtn)
        
        bottomLine.backgroundColor = UIColor.hexColor(0xFFBA17)
        bgView.addSubview(bottomLine)
        
        bgView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
        }
        allOrderBtn.snp.makeConstraints { (make) in
            make.left.equalTo(bgView.snp.left)
            make.top.equalTo(bgView.snp.top)
            make.bottom.equalTo(bgView.snp.bottom)
            make.width.equalTo(Screen_W/3)
        }
        waitComment.snp.makeConstraints { (make) in
            make.left.equalTo(allOrderBtn.snp.right)
            make.top.equalTo(bgView.snp.top)
            make.bottom.equalTo(bgView.snp.bottom)
            make.width.equalTo(Screen_W/3)
        }
        refundBtn.snp.makeConstraints { (make) in
            make.left.equalTo(waitComment.snp.right)
            make.top.equalTo(bgView.snp.top)
            make.bottom.equalTo(bgView.snp.bottom)
            make.width.equalTo(Screen_W/3)
        }
        bottomLine.snp.makeConstraints { (make) in
            make.centerX.equalTo(allOrderBtn.snp.centerX)
            make.bottom.equalTo(bgView.snp.bottom)
            make.width.equalTo(Screen_W/3)
            make.height.equalTo(2)
        }
        
    }
    
    @objc func allOrder() {
        bottomLine.center.x = allOrderBtn.center.x
        setFontAndColor(object: allOrderBtn, color: UIColor.hexColor(0x000000), font: 16)
        setFontAndColor(object: waitComment, color: UIColor.hexColor(0x666666), font: 15)
        setFontAndColor(object: refundBtn, color: UIColor.hexColor(0x666666), font: 15)
        if delegate != nil{
            delegate?.clickAll()
        }
    }
    
    @objc func waitOrder() {
        bottomLine.center.x = waitComment.center.x
        setFontAndColor(object: allOrderBtn, color: UIColor.hexColor(0x666666), font: 15)
        setFontAndColor(object: waitComment, color: UIColor.hexColor(0x000000), font: 16)
        setFontAndColor(object: refundBtn, color: UIColor.hexColor(0x666666), font: 15)
        if delegate != nil{
            delegate?.clickWait()
        }
    }
    
    @objc func refundOrder() {
        bottomLine.center.x = refundBtn.center.x
        setFontAndColor(object: allOrderBtn, color: UIColor.hexColor(0x666666), font: 15)
        setFontAndColor(object: waitComment, color: UIColor.hexColor(0x666666), font: 15)
        setFontAndColor(object: refundBtn, color: UIColor.hexColor(0x000000), font: 16)
        if delegate != nil{
            delegate?.clickRefund()
        }
    }
    
    //设置title字体，颜色
    func setFontAndColor (object:UIButton ,color:UIColor ,font:CGFloat){
        object.setTitleColor(color, for: UIControl.State.normal)
        object.titleLabel?.font = UIFont.systemFont(ofSize: font)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
