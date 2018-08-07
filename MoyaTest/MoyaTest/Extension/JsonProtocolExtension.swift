//
//  JsonProtocolExtension.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/7.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import CHLMVP

extension Array: JsonProtocol where Element: JsonModel { }
