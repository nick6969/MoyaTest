//
//  WebService-AppStore.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/5.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import Moya

extension WebService {

    func getAppStoreData(provider: MoyaProvider<AppStoreAPI> = MoyaProvider<AppStoreAPI>.default,
                         appStoreID: String,
                         success: ModelSuccessClosure<AppStoreVersionModel>?,
                         failure: ErrorClosure?) {

        request(provider: provider,
                target: .getAppVersion(id: appStoreID),
                success: success,
                failure: failure)

    }

}
