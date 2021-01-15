//
//  ToastView.swift
//  Rick-and-Morty
//
//  Created by Kanat on 15.01.2021.
//

import SwiftMessages
import UIKit

final class ToastView: MessageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func configure(category: ToastCategory, message: String?) {
        switch category {
        case .error:
            iconImageView?.image = UIImage(named: "generaError")
            backgroundView.backgroundColor = UIColor.systemGray4
            titleLabel?.textColor = UIColor.systemRed
            iconImageView?.tintColor = UIColor.systemRed
        case .success:
            iconImageView?.image = UIImage(named: "generaDone")
            backgroundView.backgroundColor = UIColor.gray
            titleLabel?.textColor = UIColor.systemGreen
            iconImageView?.tintColor = UIColor.systemGreen
        }
        titleLabel?.text = message
    }

    private func setup() {
        id = "\(Date().timeIntervalSince1970)"
        iconImageView?.image = UIImage(named: "generaError")
        backgroundView.layer.cornerRadius = 12
        backgroundView.layer.borderWidth = 0.5
        backgroundView.layer.borderColor = UIColor.systemGray4.cgColor
    }
}
