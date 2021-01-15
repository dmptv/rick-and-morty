//
//  ActionSheetHeaderViewModel.swift
//  Rick-and-Morty
//
//  Created by Kanat on 15.01.2021.
//

import UIKit

struct ActionSheetHeaderCellModel {
    let category: ActionSheetCategory
    let title: String?
    let message: String?

    var categoryIcon: UIImage? {
        switch category {
        case .default:
            return nil
        case .error:
            return UIImage(named: "generalError")
        case .warning:
            return UIImage(named: "generalWarning")
        case .success:
            return UIImage(named: "generalDone")
        }
    }

    var isStackViewTopToSuperviewConstraintActive: Bool {
        category == .default
    }

    var isStackViewTopToCategoryImageViewConstraintActive: Bool {
        category != .default
    }

    var isHiddenTitleLabel: Bool {
        title == nil
    }

    var isHiddenMessageLabel: Bool {
        message == nil
    }

    var messageTextColor: UIColor

    var messageTextFont: UIFont

    var stackViewSpacing: CGFloat

    init(category: ActionSheetCategory,
         title: String?,
         message: String?,
         stackViewSpacing: CGFloat = 8,
         messageTextColor: UIColor = .gray,
         messageTextFont: UIFont = UIFont.systemFont(ofSize: 20)) {
        self.category = category
        self.title = title
        self.message = message
        self.stackViewSpacing = stackViewSpacing
        self.messageTextColor = messageTextColor
        self.messageTextFont = messageTextFont
    }
}
