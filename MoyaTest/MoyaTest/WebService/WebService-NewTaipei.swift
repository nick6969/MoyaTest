//
//  WebService-NewTaipei.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/7.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import Moya

extension WebService {

    func getZipData(provider: MoyaProvider<NewTaipeiAPI> = MoyaProvider<NewTaipeiAPI>.default,
                    success: ModelSuccessClosure<[ZipModel]>?,
                    failure: ErrorClosure?) {

        request(provider: provider,
                target: .zip,
                success: success,
                failure: failure)
    }

    func getLibraryData(provider: MoyaProvider<NewTaipeiAPI> = MoyaProvider<NewTaipeiAPI>.default,
                        success: ModelSuccessClosure<[LibraryModel]>?,
                        failure: ErrorClosure?) {

        request(provider: provider,
                target: .library,
                success: success,
                failure: failure)
    }
}
