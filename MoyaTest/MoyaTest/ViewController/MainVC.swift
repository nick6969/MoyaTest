//
//  MainVC.swift
//  MoyaTest
//
//  Created by Nick Lin on 2018/8/5.
//  Copyright © 2018年 Nick Lin. All rights reserved.
//

import UIKit

final class MainVC: UIViewController {

    private lazy var zipButton: UIButton = buttonClosure("郵遞區號")
    private lazy var libraryButton: UIButton = buttonClosure("圖書館")
    private lazy var sightseeingFactoryButton: UIButton = buttonClosure("觀光工廠")

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var buttonClosure: ( (String) -> UIButton) = { title in
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle( title, for: .normal)
        button.addTarget(self, action: #selector(self.didTap(_:)), for: .touchUpInside)
        return button
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.addArrangedSubview(zipButton)
        stackView.addArrangedSubview(libraryButton)
        stackView.addArrangedSubview(sightseeingFactoryButton)

        view.addSubview(stackView)
        stackView.mLay(pin: .init(top: 100, left: 20, bottom: 60, right: 20))
    }

    @objc private func didTap(_ button: UIButton) {
        switch button {
        case zipButton:
            self.navigationController?.pushViewController(ZipVC(), animated: true)
        case libraryButton:
            self.navigationController?.pushViewController(LibraryVC(), animated: true)
        case sightseeingFactoryButton:
            self.navigationController?.pushViewController(SightseeingFactoryVC(), animated: true)
        default:
            break
        }
    }

}
