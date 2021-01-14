//
//  InfiniteScrollableTableView.swift
//  Rick-and-Morty
//
//  Created by Kanat on 14.01.2021.
//

import MaterialComponents.MaterialActivityIndicator
import UIKit

protocol InfiniteScrollableTableViewDelegate: class {
    func infiniteScrollDidStart(_ tableView: InfiniteScrollableTableView)
}

final class InfiniteScrollableTableView: UITableView {
    weak var infiniteScrollDelegate: InfiniteScrollableTableViewDelegate?

    override var contentOffset: CGPoint {
        didSet {
            checkInfiniteScroll()
        }
    }

    private var isEnabled = false
    private var isActive = false

    private let activityIndicator = MDCActivityIndicator(frame: CGRect(origin: .zero, size: CGSize(width: 24, height: 24)))

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        updateColors()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateColors()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    func addInfiniteScroll() {
        isEnabled = true
        isActive = false
        tableFooterView = activityIndicator
    }

    func startInfiniteScroll() {
        isActive = true
        activityIndicator.startAnimating()
    }

    func finishInfiniteScroll() {
        isActive = false
        activityIndicator.stopAnimating()
    }

    func removeInfiniteScroll() {
        isEnabled = false
        isActive = false
        tableFooterView = nil
    }

    private func checkInfiniteScroll() {
        guard isEnabled, !isActive else { return }
        let maxYOffset = contentSize.height - frame.size.height
        if maxYOffset > 0, maxYOffset - contentOffset.y <= 0 {
            startInfiniteScroll()
            infiniteScrollDelegate?.infiniteScrollDidStart(self)
        }
    }

    private func updateColors() {
        activityIndicator.cycleColors = [UIColor.blue]
    }
}
