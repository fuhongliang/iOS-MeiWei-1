//
//  FAPIResponseModels.swift
//  ZhenMeiWei
//
//  Created by KevinFu on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

class FAPIErrorModel {
    
    var code: String?
    
    var message: String?
    
    var error: Error?
    
    public static func getErrorModel(_code: String?, _message: String?, _error: Error?) -> FAPIErrorModel {
        let model = FAPIErrorModel()
        model.code = _code
        model.message = _message
        model.error = _error
        return model
    }
    
}


class FAPILoginResponseDataModel: Codable {
    
    var name: String?
    
    var period: String?
    
    var token: String?
    
    var userid: String?
    
}

class FAPILoginResponseModel: Codable {
    
    var code: String?
    
    var msg: String?
    
    var data: FAPILoginResponseDataModel?
    
}



