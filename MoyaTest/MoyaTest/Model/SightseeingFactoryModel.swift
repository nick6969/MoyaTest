//
//  SightseeingFactoryModel.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/6.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import CHLMVP

struct SightseeingFactoryModel: JsonModel {
    let title, features, tel, address: String

    enum CodingKeys: String, CodingKey {
        case title, features, tel, address
    }
}
