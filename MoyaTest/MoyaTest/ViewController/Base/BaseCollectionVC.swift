//
//  BaseCollectionVC.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/5.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit
import CHLMVP

class BaseCollectionVC<T, X>: BaseVC, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout where T: StandardPresenter, X: CellForModelProtocol & UICollectionViewCell {

    // MARK: - SubClass Need Override
    func setupPresenter() {
        assert(false, "sub class need override this method :\(#function)")
    }

    // MARK: - SubClass Can Override
    func cellDidSelect(index: IndexPath, model: T.Model) {

    }

    // if return true, you need setup cell for model by you self
    func cellForItem(with cell: X, indexPath: IndexPath, model: T.Model) -> Bool {
        return false
    }

    func cellWidthHeightProportion() -> CGFloat {
        return 1
    }

    func setupFlowLayout() {
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize.width = (UIScreen.main.bounds.width - 28) / 2
        flowLayout.itemSize.height = flowLayout.itemSize.width * cellWidthHeightProportion()
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    // Data
    var presenter: T!

    // UI
    let flowLayout = UICollectionViewFlowLayout()
    lazy var collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: self.flowLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        setupUI()
        setupFlowLayout()
        presenter.loadDelegate = self
        presenter.loadStateDelegate = self
        presenter.nextState()
    }

    fileprivate func setupUI() {
        view.backgroundColor = .white

        collectionView.register(cellType: X.self)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.mLay(pin: .zero)
    }

    @objc override func didTapReloadButton() {
        presenter.nextState()
    }

    // MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.datasCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: X.self, for: indexPath)
        if let model = presenter.model(at: indexPath.item) {
            if !cellForItem(with: cell, indexPath: indexPath, model: model) {
                cell.configCell(model, indexPath: indexPath)
            }
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if presenter.isLastData(index: indexPath.item) {
            presenter.nextState()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let model = presenter.model(at: indexPath.item) {
            cellDidSelect(index: indexPath, model: model)
        }
    }
}

extension BaseCollectionVC: PresenterLoadDelegate {

    func loadingDone(_ oldCount: Int, _ newCount: Int) {
        self.collectionView.reloadData()
    }

    func loadingFail(_ error: Error?) {

    }
}
