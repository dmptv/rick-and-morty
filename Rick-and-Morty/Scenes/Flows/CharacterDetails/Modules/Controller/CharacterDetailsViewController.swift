//
//  CharacterDetailsViewController.swift
//  Rick-and-Morty
//
//  Created by Kanat on 13.01.2021.
//

import UIKit

// swiftlint:disable all
protocol CharacterDetailsNavigationDelegate: class {
    
}

class CharacterDetailsViewController: BaseViewController {
    private let store: CharacterDetailsStore
    private weak var navigationDelegate: CharacterDetailsNavigationDelegate?
    
    init(store: CharacterDetailsStore, navigationDelegate: CharacterDetailsNavigationDelegate) {
        self.store = store
        self.navigationDelegate = navigationDelegate
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupObservers()
        store.dispatch(action: .didLoadView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    private func setupUI() {
        updateColors()
    }

    private func setupObservers() {
        store.$state.observe(self) { vc, state in
            guard let state = state else { return }
            switch state {
            case .loading:
                ProgressHud.startAnimating()
            case .loadingFinished:
                ProgressHud.stopAnimating()
            case let .error(message):
//                vc.showToast(category: .error, message: message)
                break
            }
        }
    }

    private func updateColors() {
        view.backgroundColor = UIColor.init(named: "AccentColor")
    }
}
