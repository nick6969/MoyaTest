//
//  WebService+Base.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/5.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import Foundation
import Moya
import CHLMVP
import Alamofire

typealias ModelSuccessClosure<T: JsonModel> = (T) -> Void
typealias ErrorClosure = (MoyaError) -> Void

public extension MoyaProvider {

    public final class var `default`: MoyaProvider {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.protocolClasses = [MoyaURLProtocol.self]
        let manager = Alamofire.SessionManager(configuration: configuration)
        manager.startRequestsImmediately = false
        return MoyaProvider<Target>(callbackQueue: .global(), manager: manager)
    }
}

final class WebService: NSObject {

    static let shared: WebService = WebService()

    func request<T, Y>(provider: MoyaProvider<Y> = MoyaProvider<Y>.default,
                       target: Y,
                       success: ModelSuccessClosure<T>?,
                       failure: ErrorClosure?) where T: JsonModel {

        provider.request(target) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    try success?(moyaResponse.data.decodeToModel(type: T.self))
                } catch {
                    failure?(MoyaError.objectMapping(error, moyaResponse))
                }
            case let .failure(error):
                failure?(error)
            }
        }
    }
}
