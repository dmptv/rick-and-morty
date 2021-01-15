//
//  ActionSheetHeaderCell.swift
//  Rick-and-Morty
//
//  Created by Kanat on 15.01.2021.
//

import UIKit

final class ActionSheetHeaderCell: UITableViewCell {
    private var messageTextColor = UIColor.systemBlue {
        didSet {
            messageLabel.textColor = messageTextColor
        }
    }

    @IBOutlet private var categoryImageView: UIImageView!
    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var messageLabel: UILabel!
    @IBOutlet private var categoryImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private var stackViewTopToSuperviewConstraint: NSLayoutConstraint!
    @IBOutlet private var stackViewTopToCategoryImageViewConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        updateColors()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    func configure(with cellModel: ActionSheetHeaderCellModel) {
        categoryImageView.image = cellModel.categoryIcon
        stackView.spacing = cellModel.stackViewSpacing
        titleLabel.text = cellModel.title
        titleLabel.isHidden = cellModel.isHiddenTitleLabel
        messageLabel.text = cellModel.message
        messageLabel.font = cellModel.messageTextFont
        messageTextColor = cellModel.messageTextColor
        messageLabel.isHidden = cellModel.isHiddenMessageLabel
        categoryImageViewTopConstraint.isActive = cellModel.isStackViewTopToCategoryImageViewConstraintActive
        stackViewTopToSuperviewConstraint.isActive = cellModel.isStackViewTopToSuperviewConstraintActive
        stackViewTopToCategoryImageViewConstraint.isActive = cellModel.isStackViewTopToCategoryImageViewConstraintActive
    }

    private func updateColors() {
        categoryImageView.tintColor = UIColor.systemGreen
        titleLabel.textColor = UIColor.systemBlue
        messageLabel.textColor = UIColor.systemBlue
    }
}
