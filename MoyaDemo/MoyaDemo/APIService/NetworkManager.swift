//
//  NetworkManager.swift
//  MoyaDemo
//
//  Created by Lahiru Chathuranga on 12/21/18.
//  Copyright © 2018 Elegant Media pvt ltd. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

enum APIEnvironment {
    case development
    case staging
    case production
}

struct NetworkManager {
    private static let API_KEY = "zTpmXn4jZGy17aKdVJkpJxs4FVfj6CsUS"
    
    static let environment: APIEnvironment = .development
    
    static var baseUrl: String {
        switch environment {
        case .development: return "http://checkedin.sandbox6.elegant-media.com/api/v1"
        case .production: return ""
        case .staging: return ""
        }
    }
    
    static var headerWithApi:[String: String] {
        return ["Content-type": "application/json",
                "Accept": "application/json",
                "Authorization": "Bearer \(API_KEY)"]
    }
}
