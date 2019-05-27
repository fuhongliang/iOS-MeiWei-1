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
    
}

class FAPIUserServices: FAPIUserServicesProtocol {
    func getSms(phone_number: String, _ success: @escaping (((FAPISMSResponseModel) -> Void)), _ fail: @escaping ((FAPIErrorModel) -> Void)) {
        FAPIService.shared.request(.getSms(phone_number: phone_number), { (data) in
            do {
                let model = try JSONDecoder().decode(FAPISMSResponseModel.self, from: data)
                success(model)
            }
            catch {
                let errorModel = FAPIErrorModel.getErrorModel(_code: nil, _message: "解析失败", _error: "解析失败")
                fail(errorModel)
            }
            
        }) { (error) in
            fail(error)
        }
    }
    
}
