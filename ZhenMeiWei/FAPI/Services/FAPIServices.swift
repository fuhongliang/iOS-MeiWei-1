//
//  FAPIServices.swift
//  ZhenMeiWei
//
//  Created by KevinFu on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

import Foundation
import Moya
import Alamofire
import MBProgressHUD

fileprivate let ssl: Bool = false
fileprivate let baseHTTPSURLString: String = "https://XXXXXXXXXX"
fileprivate let baseHTTPURLString: String = "http://XXXXXXXXX"
fileprivate let baseURLIP: String = "XXXXXXXX"


let loadingPlugin = NetworkActivityPlugin { (type, target) in
    guard let vc = topVC else { return }
    switch type {
    case .began:
        MBProgressHUD.hide(for: vc.view, animated: false)
        MBProgressHUD.showAdded(to: vc.view, animated: true)
    case .ended:
        MBProgressHUD.hide(for: vc.view, animated: true)
    }
}

let TimeoutClosure = {(endpoint: Endpoint, closure: MoyaProvider<NetFAPI>.RequestResultClosure) -> Void in
    
    if var urlRequest = try? endpoint.urlRequest() {
        urlRequest.timeoutInterval = 20
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}

enum NetFAPI {
    case regist(newUser: [String:String])
    case login(user: [String:String])
    case logout(userId: String)
    case fetchFriends(userId: String)
    case updateProfile(userId: String, userName: String, password: String, newPassword: String)
    case addFriend(userId: String,friendid: String,verif_code: String)
    case sendMessage(userId: String,receive: String,message: String)
    case getMessageList(userId: String)
    case getMessage(userId: String,msg_id: String)
    case sendBomb(userId: String)
    case acceptNewFriend(user_id:String,friendid:String)
}

extension NetFAPI: TargetType {
    var baseURL: URL {
        if ssl {
            return URL(string: baseHTTPSURLString)!
        }
        else {
            return URL(string: baseHTTPURLString)!
        }
    }
    
    var path: String {
        switch self {
        case .regist:
            return "/users/"
        case .login:
            return "/tokens/"
        case .logout(let userId):
            return "/tokens/" + userId + "/"
        case .fetchFriends(let userId):
            return "/frends/" + userId + "/"
        case .updateProfile(let userId, _, _, _):
            return "/users/" + userId + "/"
        case .addFriend(let userId, _, _):
            return "/frends/"+userId+"/req/"
        case .sendMessage(let userId, _, _):
            return "/messsages/" + userId + "/"
        case .getMessageList(let userId):
            return "/messsages/" + userId + "/"
        case .getMessage(let userId, let msg_id):
            return "/messsages/" + userId + msg_id + "/"
        case .sendBomb(let userId):
            return "/bombs/" + userId + "/"
        case .acceptNewFriend(let user_id,_):
            return "/frends/" + user_id + "/accept/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .regist, .login:
            return .post
        case .logout:
            return .delete
        case .fetchFriends:
            return .get
        case .updateProfile:
            return .put
        case .addFriend:
            return .post
        case .sendMessage:
            return .post
        case .getMessageList:
            return .get
        case .getMessage:
            return .get
        case .sendBomb:
            return .post
        case .acceptNewFriend:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .regist(let newUser):
            return .requestParameters(parameters: newUser, encoding: JSONEncoding.default)
        case .login(let user):
            return .requestParameters(parameters: user, encoding: JSONEncoding.default)
        case .logout(let userId):
            return .requestParameters(parameters: ["userid":userId], encoding: JSONEncoding.default)
        case .fetchFriends:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .updateProfile(_, let userName, let password, let newPassword):
            let params: [String:String] = ["name":userName,"password":password,"newpassword":newPassword]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .addFriend(_, let friendid, let verif_code):
            let params: [String:String] = ["friendid":friendid,"verif_code":verif_code]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .sendMessage(_, let receive, let message):
            let params: [String:String] = ["receive":receive,"message":message]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .getMessageList:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .getMessage:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .sendBomb(_):
            return .requestParameters(parameters: [:],  encoding: JSONEncoding.default)
        case .acceptNewFriend(_,let friendid):
            return .requestParameters(parameters: ["friendid":friendid], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        var dict: [String:String] = [
            "Content-Type":"application/json"
        ]
        switch self {
        case .logout, .fetchFriends, .updateProfile, .addFriend , .sendMessage, .getMessageList,.getMessage,.sendBomb,.acceptNewFriend:
            let token: String = getToken() // 本地token
            dict["token"] = token
        default:
            break
        }
        return dict
    }
    
    
}

class FAPIService {
    
    private init(needMBProgressHUD:Bool) {
        
        if ssl {
            
            let configuration = URLSessionConfiguration.default
            configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
            
            let path: String = Bundle.main.path(forResource: "ghj", ofType: "cer") ?? ""
            let certificationData = try? Data(contentsOf: URL(fileURLWithPath: path)) as CFData
            
            let certificate = SecCertificateCreateWithData(nil, certificationData!)
            let certificates: [SecCertificate] = [certificate!]
            
            let policies: [String: ServerTrustPolicy] = [baseURLIP: ServerTrustPolicy.pinCertificates(certificates: certificates, validateCertificateChain: true, validateHost: false)]
            
            manager = Manager(configuration: configuration, serverTrustPolicyManager: ServerTrustPolicyManager(policies: policies))
            
            let endpoint = { (target: NetFAPI) -> Endpoint in
                let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
                return defaultEndpoint
            }
            
            let requestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
                do {
                    let request = try endpoint.urlRequest()
                    // Modify the request however you like.
                    done(.success(request))
                } catch {
                    //                done(.failure(MoyaError.underlying(error)))
                }
            }
            
            let stubClosure = { (_: NetFAPI) -> Moya.StubBehavior in return .never }  // .immediate
            
            if needMBProgressHUD {
                
                let APIProvider = MoyaProvider<NetFAPI>(endpointClosure: endpoint,
                                                        requestClosure: requestClosure,
                                                        stubClosure: stubClosure,
                                                        manager: manager!,
                                                        plugins: [loadingPlugin,NetworkLoggerPlugin(verbose: true, cURL: true)])
                apiProvider = APIProvider
            }else {
                
                let APIProvider = MoyaProvider<NetFAPI>(endpointClosure: endpoint,
                                                        requestClosure: requestClosure,
                                                        stubClosure: stubClosure,
                                                        manager: manager!,
                                                        plugins: [NetworkLoggerPlugin(verbose: true, cURL: true)])
                apiProvider = APIProvider
                
            }
            
            
        }
        else {
            let APIProvider = MoyaProvider<NetFAPI>(plugins: [loadingPlugin])
            apiProvider = APIProvider
        }
        
    }
    
    public static let shared: FAPIService = FAPIService(needMBProgressHUD: true)
    
    public static let sharedBackground: FAPIService = FAPIService(needMBProgressHUD: false)
    
    private var manager: SessionManager?
    
    fileprivate(set) var apiProvider: MoyaProvider<NetFAPI>!
    
    func request(_ target: NetFAPI, _ success: @escaping ((Data) -> ()), _ fail: @escaping ((FAPIErrorModel) -> ())) {
        apiProvider.request(target) { (result) in
            print("--------接口响应----------------")
            switch result {
            case let .success(moyaResponse):
                do {
                    let anyData = try moyaResponse.mapJSON()
                    let data =  moyaResponse.data
                    let statusCode =  moyaResponse.statusCode
                    print("\(data) --- \(statusCode) ----- \(anyData)")
                    if statusCode == 200 {
                        if let mapData: [String:Any] = anyData as? [String:Any] {
                            if mapData.keys.contains("code") {
                                if let code = mapData["code"] as? String {
                                    if code == "200" {
                                        success(data)
                                    }
                                    else {
                                        let msg: String = mapData["msg"] as? String ?? "Error message"
                                        let errorModel = FAPIErrorModel.getErrorModel(_code: code, _message: msg, _error: nil)
                                        fail(errorModel)
                                    }
                                }
                                else {
                                    let errorModel = FAPIErrorModel.getErrorModel(_code: String(moyaResponse.statusCode), _message: "Data not contain code", _error: nil)
                                    fail(errorModel)
                                }
                            }
                            else {
                                let errorModel = FAPIErrorModel.getErrorModel(_code: String(moyaResponse.statusCode), _message: "Data not contain code", _error: nil)
                                fail(errorModel)
                            }
                        }
                        else {
                            let errorModel = FAPIErrorModel.getErrorModel(_code: String(moyaResponse.statusCode), _message: String(moyaResponse.description), _error: nil)
                            fail(errorModel)
                        }
                    }else if statusCode == 401 {//token过期
                       // (UIApplication.shared.delegate as! AppDelegate).showLoginView()
                    }
                    else {
                        if let mapData: [String:Any] = anyData as? [String:Any] {
                            if mapData.keys.contains("message") {
                                if let message = mapData["message"] as? String {
                                    let errorModel = FAPIErrorModel.getErrorModel(_code: String(moyaResponse.statusCode), _message: message, _error: nil)
                                    fail(errorModel)
                                }
                            }
                            
                        }else{
                            let errorModel = FAPIErrorModel.getErrorModel(_code: String(moyaResponse.statusCode), _message: String(moyaResponse.description), _error: nil)
                            fail(errorModel)
                        }
                    }
                    
                } catch {
                    print(error.localizedDescription)
                    let errorModel = FAPIErrorModel.getErrorModel(_code: String(moyaResponse.statusCode), _message: nil, _error: error)
                    fail(errorModel)
                }
                
            case let .failure(error):
                print(error.localizedDescription)
                let errorModel = FAPIErrorModel.getErrorModel(_code: nil, _message: nil, _error: error)
                fail(errorModel)
            }
            print("----------响应结束--------------")
        }
    }
    
}

class FAPITest {
    
    public static func test() {
        //        testLogin()
    }
    
}




