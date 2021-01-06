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
        title = "Rock and Marty"
        setupTableView()
        updateColors()
    }

    private func setupTableView() {
        
    }

    private func updateColors() {
        view.backgroundColor = .white
    }
    
    deinit {
        print("*** deinited \(self.description)")
    }

}
