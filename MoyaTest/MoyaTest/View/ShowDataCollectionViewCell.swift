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

        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor(red: 0x74/0xff, green: 0x74/0xff, blue: 0x74/0xff, alpha: 1).cgColor
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowColor = UIColor.darkGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        contentView.layer.shadowRadius = 2.0
        contentView.layer.shadowOpacity = 0.5

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
