//
//  ZipModel.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/5.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import Foundation
import CHLMVP

struct ZipModel: JsonModel {
    let district, zipcode: String

    enum CodingKeys: String, CodingKey {
        case district = "District"
        case zipcode
    }
}
