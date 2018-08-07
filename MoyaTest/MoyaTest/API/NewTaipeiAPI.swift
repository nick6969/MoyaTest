//
//  NewTaipeiAPI.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/7.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import Moya

enum NewTaipeiAPI {
    case zip
    case library
}

extension NewTaipeiAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://data.ntpc.gov.tw/od/data/api/")!
    }

    var path: String {
        switch self {
        case .zip:
            return "AC110AF8-C847-43E5-B62C-7985E9E049F9"
        case .library:
            return "6BE524A8-EF72-4CD7-82DE-E75C9F46821D"
        }
    }

    var method: Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        var para: [String: Any] = [:]
        para["$format"] = "json"
//        switch self {
//        case .zip:
//            return Task.requestParameters(parameters: para, encoding: URLEncoding.default)
//        }
        return Task.requestParameters(parameters: para, encoding: URLEncoding.default)

    }

    var headers: [String: String]? {
        return nil
    }

    var validationType: ValidationType {
        return .successCodes
    }
}
