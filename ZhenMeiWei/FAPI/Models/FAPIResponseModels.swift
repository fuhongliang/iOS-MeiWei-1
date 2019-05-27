//
//  FAPIResponseModels.swift
//  ZhenMeiWei
//
//  Created by KevinFu on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

class FAPIErrorModel {
    
    var code: Int?
    
    var msg: String?
    
    var data: String?
    
    public static func getErrorModel(_code: Int?, _message: String?, _error: String?) -> FAPIErrorModel {
        let model = FAPIErrorModel()
        model.code = _code
        model.msg = _message
        model.data = _error
        return model
    }
    
}


class FAPISMSResponseModel: Codable {
    
    var code: Int?
    
    var msg: String?
    
    var data: String?
}


class FAPILoginResponseDataModel: Codable {
    var name: String?
    var token: String?
    var userid: String?
}

    
class FAPILoginResponseModel: Codable {
    
    var code: Int?
    
    var msg: String?
    
    var data: FAPILoginResponseDataModel?
    
}




