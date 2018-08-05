//
//  AppStoreAPI.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/5.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import Moya

enum AppStoreAPI {
    case getAppVersion(id: String)
}

extension AppStoreAPI: TargetType {
    var baseURL: URL { return URL(string: "http://itunes.apple.com")! }
    var path: String { return "/lookup" }
    var method: Moya.Method { return .get }
    var sampleData: Data { return Data() }

    var task: Task {
        var para: [String: Any] = [:]
        switch self {
        case .getAppVersion(let identify):
            para["id"] = identify
        }
        return .requestParameters(parameters: para, encoding: URLEncoding.default)
    }

    var headers: [String: String]? { return nil }
    var validationType: ValidationType { return .successCodes}

}
