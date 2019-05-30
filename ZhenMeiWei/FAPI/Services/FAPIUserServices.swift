//
//  FAPIUserServices.swift
//  ZhenMeiWei
//
//  Created by KevinFu on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

protocol FAPIUserServicesProtocol {
    
    func getSms(phone_number: String, _ success: @escaping(((FAPISMSResponseModel) -> Void)), _ fail: @escaping ((FAPIErrorModel) -> Void))
    func homePage(longitude:String, dimension:String, type:String, _ success: @escaping(((FAPISMSResponseModel) -> Void)), _ fail: @escaping ((FAPIErrorModel) -> Void))
    
}

class FAPIUserServices: FAPIUserServicesProtocol {
    func getSms(phone_number: String, _ success: @escaping (((FAPISMSResponseModel) -> Void)), _ fail: @escaping ((FAPIErrorModel) -> Void)) {
        FAPIService.shared.request(.getSms(phone_number: phone_number), { (data) in

            
        }) { (error) in
            fail(error)
        }
    }
    
    func homePage(longitude: String, dimension: String, type: String, _ success: @escaping (((FAPISMSResponseModel) -> Void)), _ fail: @escaping ((FAPIErrorModel) -> Void)) {
        FAPIService.shared.request(.home_page(longitude: longitude, dimension: dimension, type: type), { (data) in

        }) { (FAPIErrorModel) in
            
        }
    }
    
}
