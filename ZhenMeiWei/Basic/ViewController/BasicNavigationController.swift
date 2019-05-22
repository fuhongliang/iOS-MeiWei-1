//
//  BasicNavigationController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class BasicNavigationController: UINavigationController ,UINavigationControllerDelegate {

    
    var popDelegate:UIGestureRecognizerDelegate?
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 26/255.0, green: 37/255.0, blue: 58/255.0, alpha: 1)
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor:UIColor.black]
        
        //返回手势
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController == self.viewControllers[0]{
            self.interactivePopGestureRecognizer?.delegate = self.popDelegate
        }else{
            self.interactivePopGestureRecognizer?.delegate = nil
        }
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count > 0{
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "top_icon_fanhui"), style: .plain, target: self, action: #selector(navigationBack))
            viewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc private func navigationBack() {
        popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
