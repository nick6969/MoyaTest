//
//  ShowDataCollectionViewCell.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/7.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit
import CHLMVP

final class ShowDataCollectionViewCell: UICollectionViewCell, CellForModelProtocol {

    private let titleLabel: UILabel = UILabel()
    private let detailLabel: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)

        titleLabel.mLay(pin: .init(top: 5, left: 8, right: 8))
        titleLabel.mLay(.height, .equal, contentView, multiplier: 0.45, constant: 0)

        detailLabel.mLay(pin: .init(left: 8, bottom: 5, right: 8))
        detailLabel.mLay(.height, .equal, contentView, multiplier: 0.45, constant: 0)

        titleLabel.textAlignment = .center
        detailLabel.textAlignment = .center
    }

    func configCell(_ model: JsonModel, indexPath: IndexPath) {
        if let model = model as? ZipModel {
            titleLabel.text = model.zipcode
            detailLabel.text = model.district
        } else if let model = model as? LibraryModel {
            titleLabel.text = model.name
            detailLabel.text = model.address
        } else if let model = model as? SightseeingFactoryModel {
            titleLabel.text = model.title
            detailLabel.text = model.address
        }
    }

}
