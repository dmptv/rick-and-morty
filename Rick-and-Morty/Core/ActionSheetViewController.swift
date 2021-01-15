//
//  ActionSheetViewController.swift
//  Rick-and-Morty
//
//  Created by Kanat on 15.01.2021.
//

import UIKit

final class ActionSheetViewController: BaseViewController {
    private enum Section {
        case header(viewModel: ActionSheetHeaderCellModel)
        case items(items: [ActionSheetItem])
    }

    private let sections: [Section]

    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var tableViewHeightConstraint: NSLayoutConstraint!

    init(category: ActionSheetCategory, title: String?, message: String?, items: [ActionSheetItem]) {
        if title != nil || message != nil {
            sections = [
                .header(viewModel: ActionSheetHeaderCellModel(category: category, title: title, message: message)),
                .items(items: items)
            ]
        } else {
            sections = [.items(items: items)]
        }
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.reloadData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableViewHeightConstraint.constant = tableView.contentSize.height
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableViewHeightConstraint.constant = tableView.contentSize.height
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    private func setupUI() {
        tableView.tableFooterView = UIView()
        [ActionSheetHeaderCell.self, ActionSheetItemCell.self].forEach { tableView.register(cellClass: $0) }
        updateColors()
    }

    private func updateColors() {
        view.backgroundColor = UIColor.systemGray5
        tableView.separatorColor = UIColor.systemTeal
    }
}

extension ActionSheetViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .header:
            return 1
        case let .items(items):
            return items.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case let .header(viewModel):
            let cell: ActionSheetHeaderCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: viewModel)
            return cell
        case let .items(items):
            let cell: ActionSheetItemCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: items[indexPath.row])
            return cell
        }
    }
}

extension ActionSheetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch sections[indexPath.section] {
        case .header:
            break
        case let .items(items):
            DispatchQueue.main.async { [weak self] in
                self?.presentingViewController?.dismiss(animated: true)
                items[indexPath.row].completion?()
            }
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections[indexPath.section] {
        case let .header(viewModel):
            return heightForHeaderCell(viewModel: viewModel)
        case .items:
            return 52.0
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections[indexPath.section] {
        case let .header(viewModel):
            return heightForHeaderCell(viewModel: viewModel)
        case .items:
            return 52.0
        }
    }

    private func heightForHeaderCell(viewModel: ActionSheetHeaderCellModel) -> CGFloat {
        var height: CGFloat = 48
        let width = view.bounds.width - 80
        let imageIsHidden = viewModel.categoryIcon == nil

        if !imageIsHidden { height += 48 }

        if let title = viewModel.title {
            if !imageIsHidden { height += 24 }
            height += title.height(withConstrainedWidth: width, font: UIFont.systemFont(ofSize: 16))
        }

        if let message = viewModel.message {
            if !viewModel.isHiddenTitleLabel {
                height += 8
            } else if !imageIsHidden {
                height += 24
            }
            height += message.height(withConstrainedWidth: width, font: UIFont.systemFont(ofSize: 16))
        }
        return height
    }
}
