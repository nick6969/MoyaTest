//
//  SightseeingFactoryVC.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/7.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit
import CHLMVP

final class SightseeingFactoryPresenter: BasePresenter<SightseeingFactoryModel>, StandardPresenter {

    func loadData() {

    }

    func loadDataMore() {

    }

}

final class SightseeingFactoryVC: BaseCollectionVC<SightseeingFactoryPresenter, ShowDataCollectionViewCell> {

    override func setupPresenter() {
        self.presenter = SightseeingFactoryPresenter()
    }

}
