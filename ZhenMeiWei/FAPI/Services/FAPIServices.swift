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
//开发环境接口地址 http://47.111.27.189:88/u1/
fileprivate let baseHTTPSURLString: String = "https://47.111.27.189:88/u1/"
fileprivate let baseHTTPURLString: String = "http://47.111.27.189:88/u1/"
fileprivate let baseURLIP: String = "47.111.27.189:88/u1/"


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
    case getSms(phone_number:String)
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
       
        case .getSms(_):
            return "get_sms/"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .getSms:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getSms(let phone_number):
            let params: [String:String] = ["phone_number":phone_number]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        var dict: [String:String] = [
            "Content-Type":"application/json"
        ]
        switch self {
//        case .logout, .fetchFriends, .updateProfile, .addFriend , .sendMessage, .getMessageList,.getMessage,.sendBomb,.acceptNewFriend:
//            let token: String = getToken() // 本地token
//            dict["token"] = token
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
                                if let code = mapData["code"] as? Int {
                                    if code == 200 {
                                        success(data)
                                    }
                                    else {
                                        let msg: String = mapData["msg"] as? String ?? "Error message"
                                        let errorModel = FAPIErrorModel.getErrorModel(_code: code, _message: msg, _error: nil)
                                        fail(errorModel)
                                    }
                                }
                                else {
                                    let errorModel = FAPIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _message: "Data not contain code", _error: nil)
                                    fail(errorModel)
                                }
                            }
                            else {
                                let errorModel = FAPIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _message: "Data not contain code", _error: nil)
                                fail(errorModel)
                            }
                        }
                        else {
                            let errorModel = FAPIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _message: String(moyaResponse.description), _error: nil)
                            fail(errorModel)
                        }
                    }else if statusCode == 3000 ||  statusCode == 3001 ||  statusCode == 3002 {//token过期
                        (UIApplication.shared.delegate as! AppDelegate).showLoginView()
                    }
                    else {
                        if let mapData: [String:Any] = anyData as? [String:Any] {
                            if mapData.keys.contains("message") {
                                if let message = mapData["message"] as? String {
                                    let errorModel = FAPIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _message: message, _error: nil)
                                    fail(errorModel)
                                }
                            }
                            
                        }else{
                            let errorModel = FAPIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _message: String(moyaResponse.description), _error: "数据解析异常")
                            fail(errorModel)
                        }
                    }
                    
                } catch {
                    print(error.localizedDescription)
                    let errorModel = FAPIErrorModel.getErrorModel(_code: moyaResponse.statusCode, _message: "数据解析异常", _error: "数据解析异常")
                    fail(errorModel)
                }
                
            case let .failure(error):
                print(error.localizedDescription)
                let errorModel = FAPIErrorModel.getErrorModel(_code: nil, _message: "数据解析异常", _error: "数据解析异常")
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




