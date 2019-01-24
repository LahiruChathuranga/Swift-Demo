//
//  UserService.swift
//  MoyaDemo
//
//  Created by Lahiru Chathuranga on 12/21/18.
//  Copyright © 2018 Elegant Media pvt ltd. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum MyServerAPI {
    case login(param: Parameters)
}

extension MyServerAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://checkedin.sandbox6.elegant-media.com/api/v1")!
    }
    
    var path: String {
        switch self {
        case .login(_):
            return "/auth/login"
        
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login(_):
            return .post
        
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login(let param):
            var updateParam = param
            updateParam.updateValue(Util.deviceId, forKey: "device_id")
            updateParam.updateValue("APPLE", forKey: "device_type")
            updateParam.updateValue("push_token", forKey: "device_push_token")
            return .requestParameters(parameters: updateParam, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .login(_):
            return NetworkManager.headerWithApi
        }
    }
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var authorizationType: AuthorizationType {
        return .none
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
    
}


