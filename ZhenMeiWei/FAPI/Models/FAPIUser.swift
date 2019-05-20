//
//  FAPIUser.swift
//  ZhenMeiWei
//
//  Created by KevinFu on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation


class FAPIUser {
    
    private init() {}
    
    public static let shared: FAPIUser = FAPIUser()
    
    public var user: FAPILoginResponseDataModel?
    
    public func saveUserToCache() {
        guard user != nil else {
            return
        }
        do {
            let data = try JSONEncoder().encode(user!)
            UserDefaults.standard.set(data, forKey: "FAPI_USER")
        }
        catch {
            // do nothing
            print("Error")
        }
    }
    
    public func loadUserFromCache() {
        if let data = UserDefaults.standard.object(forKey: "FAPI_USER") as? Data {
            do {
                user = try JSONDecoder().decode(FAPILoginResponseDataModel.self, from: data)
            }
            catch {
                print("Error")
            }
        }
    }
    
    public func cleanUser() {
        user = nil
        UserDefaults.standard.set("", forKey: "FAPI_USER")
    }
    
}
