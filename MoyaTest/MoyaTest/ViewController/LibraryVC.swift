//
//  LibraryVC.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/7.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit
import CHLMVP

final class LibraryPresenter: BasePresenter<LibraryModel>, StandardPresenter {

    func loadData() {

    }

    func loadDataMore() {

    }

}

final class LibraryVC: BaseCollectionVC<LibraryPresenter, ShowDataCollectionViewCell> {

    override func setupPresenter() {
        self.presenter = LibraryPresenter()
    }

}
