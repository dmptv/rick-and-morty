//
//  MainViewController.swift
//  Test-Project
//
//  Created by Kanat on 05.01.2021.
//

import UIKit

protocol MainNavigationDelegate: class {
    
}

private enum Constants {
    static let menuProgressFromTipThreshold: CGFloat = 44
}

final class MainViewController: BaseViewController {
    private weak var navigationDelegate: MainNavigationDelegate?

    init(navigationDelegate: MainNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateColors()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }


    private func updateColors() {
        view.backgroundColor = .white
    }
    
    deinit {
        print("*** deinited \(self.description)")
    }

}
