//
//  WebService-AppStore.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/5.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import Moya

enum AppStoreAreaType: String {
    case twArea = "TW"
}

extension WebService {

    func getAppStoreData(provider: MoyaProvider<AppStoreAPI> = MoyaProvider<AppStoreAPI>.default,
                         appStoreID: String,
                         storeArea: AppStoreAreaType,
                         success: ModelSuccessClosure<AppStoreVersionModel>?,
                         failure: ErrorClosure?) {

        request(provider: provider,
                target: .getAppVersion(id: appStoreID, storeArea: storeArea),
                success: success,
                failure: failure)

    }

}
