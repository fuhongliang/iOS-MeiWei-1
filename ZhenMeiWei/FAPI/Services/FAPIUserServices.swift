//
//  FAPIUserServices.swift
//  ZhenMeiWei
//
//  Created by KevinFu on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

protocol FAPIUserServicesProtocol {
    func login(userId: String, password: String, _ success: @escaping(((FAPILoginResponseModel) -> Void)), _ fail: @escaping ((FAPIErrorModel) -> Void))
    func regist(userId: String, inviteCode: String, company: String?, userName: String, password: String, _ success: @escaping((() -> Void)), _ fail: @escaping ((FAPIErrorModel) -> Void))
    func logout(userId: String, _ success: @escaping((() -> Void)), _ fail: @escaping ((FAPIErrorModel) -> Void))
  
}

class FAPIUserServices: FAPIUserServicesProtocol {
 
    func logout(userId: String, _ success: @escaping ((() -> Void)), _ fail: @escaping ((FAPIErrorModel) -> Void)) {
        FAPIService.shared.request(.logout(userId: userId), { (data) in
            cleanToken()
            success()
        }) { (error) in
            fail(error)
        }
    }
    
    func regist(userId: String, inviteCode: String, company: String?, userName: String, password: String, _ success: @escaping ((() -> Void)), _ fail: @escaping ((FAPIErrorModel) -> Void)) {
        var params: [String:String] = [
            "userid": userId,
            "invite_code": inviteCode,
            "name": userName,
            "password": password
        ]
        if company != nil {
            params["company"] = company!
        }
        FAPIService.shared.request(.regist(newUser: params), { (data) in
            success()
        }) { (error) in
            fail(error)
        }
    }
    
    func login(userId: String, password: String, _ success: @escaping(((FAPILoginResponseModel) -> Void)), _ fail: @escaping ((FAPIErrorModel) -> Void)) {
        let params: [String:String] = [
            "userid":userId,
            "password": password
        ]
        FAPIService.shared.request(.login(user: params), { (data) in
            do {
                let model = try JSONDecoder().decode(FAPILoginResponseModel.self, from: data)
                if let token = model.data?.token {
                    saveToken(token: token)
                    FAPIUser.shared.user = model.data
                    FAPIUser.shared.saveUserToCache()
                }
                success(model)
            }
            catch {
                let errorModel = FAPIErrorModel.getErrorModel(_code: nil, _message: nil, _error: error)
                fail(errorModel)
            }
        }) { (error) in
            fail(error)
        }
    }
}
