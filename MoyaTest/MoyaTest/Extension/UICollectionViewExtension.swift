//
//  UICollectionViewExtension.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/5.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

extension UICollectionView {

    func register<T: UICollectionViewCell>(cellType: T.Type) {
        register(cellType, forCellWithReuseIdentifier: NSStringFromClass(cellType))
    }

    func register<T: UICollectionViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach { register(cellType: $0) }
    }

    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        // swiftlint:disable force_cast
        return dequeueReusableCell(withReuseIdentifier: NSStringFromClass(type), for: indexPath) as! T
        // swiftlint:enable force_cast
    }
}
