//
//  MainViewController.swift
//  Test-Project
//
//  Created by Kanat on 05.01.2021.
//

import UIKit

//TODO: - dlegate

protocol MainNavigationDelegate: class {
    
}

private enum Constants {
    
}

final class MainViewController: BaseViewController {
    private let store: MainStore
    private weak var navigationDelegate: MainNavigationDelegate?
    private let tableViewDelegateImpl: MainTableViewDelegateImpl
    private let tableViewDataSourceImpl: MainTableViewDataSourceImpl
    
    @IBOutlet private var tableView: UITableView!
    
    init(store: MainStore, navigationDelegate: MainNavigationDelegate) {
        self.store = store
        self.navigationDelegate = navigationDelegate
        tableViewDataSourceImpl = .init(store: store)
        tableViewDelegateImpl = .init(store: store)
        super.init(nibName: nil, bundle: nil)
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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }
    
    private func setupUI() {
        title = "Rick and Morty"
        setupTableView()
        updateColors()
    }

    private func setupTableView() {
        tableView.dataSource = tableViewDataSourceImpl
        tableView.delegate = tableViewDelegateImpl
        tableView.register(cellClass: CharacterTableViewCell.self)
    }
    
    private func setupObservers() {
        store.$state.observe(self) { vc, state in
            guard let state = state else { return }
            switch state {
            case .loading:
//                ProgressHud.startAnimating()
                break
            case .loadingFinished:
//                ProgressHud.stopAnimating()
                break
            case let .sections(sections):
                vc.tableViewDelegateImpl.sections = sections
                vc.tableViewDataSourceImpl.sections = sections
                vc.tableView.reloadData()
            case let .error(message):
//                vc.showToast(category: .error, message: message)
                print("error", message as Any)
            }
        }
    }

    private func updateColors() {
        view.backgroundColor = .white
    }
    
    deinit {
        print("*** deinited \(self.description)")
    }

}
