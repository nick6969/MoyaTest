//
//  ZipVC.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/7.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit
import CHLMVP

final class ZipPresenter: BasePresenter<ZipModel>, StandardPresenter {

    func loadData() {
        WebService.shared.getZipData(success: modelsSuccessClosure, failure: loadFailClosure)
    }

    func loadDataMore() {

    }

}

final class ZipVC: BaseCollectionVC<ZipPresenter, ShowDataCollectionViewCell> {

    override func setupPresenter() {
        self.presenter = ZipPresenter()
    }

}
