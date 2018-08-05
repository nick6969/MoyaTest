//
//  CellForModelProtocol.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/5.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit
import CHLMVP

protocol CellForModelProtocol: AnyObject {
    func configCell(_ model: JsonModel, indexPath: IndexPath)
}
