//
//  ActionSheetItemCell.swift
//  Rick-and-Morty
//
//  Created by Kanat on 15.01.2021.
//

import UIKit

final class ActionSheetItemCell: UITableViewCell {
    @IBOutlet private var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        updateColors()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    func configure(with item: ActionSheetItem) {
        titleLabel.text = item.title.uppercased()
    }

    private func updateColors() {
        setSelectedBackgroundView(with: UIColor.systemGray4)
        titleLabel.textColor = UIColor.secondaryLabel
    }
}
