//
//  AppStoreVersionModel.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/5.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import CHLMVP

struct AppStoreVersionModel: JsonModel {
    private struct VersionModel: JsonModel {
        let version: String
        let releaseNotes: String
    }
    private let results: [VersionModel]
    var version: String? {
        return results.last?.version
    }
    var releaseNotes: String? {
        return results.last?.releaseNotes
    }
    var hasNewVersion: Bool {
        guard let bundleVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
            let latestVersion = version else {
                return false
        }
        return latestVersion.compare(bundleVersion, options: .numeric) == .orderedDescending
    }
}
