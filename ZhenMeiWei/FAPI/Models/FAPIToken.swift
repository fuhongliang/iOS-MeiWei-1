//
//  FAPIToken.swift
//  ZhenMeiWei
//
//  Created by KevinFu on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

public func saveToken(token: String) {
    UserDefaults.standard.set(token, forKey: "FAPI_TOKEN")
}

public func cleanToken() {
    UserDefaults.standard.set("", forKey: "FAPI_TOKEN")
}

public func getToken() -> String {
    if let token = UserDefaults.standard.object(forKey: "FAPI_TOKEN") as? String {
        if token.count > 0 {
            return token
        }
    }
    return ""
}
