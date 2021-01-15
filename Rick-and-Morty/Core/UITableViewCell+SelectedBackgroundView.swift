//
//  UITableViewCell+SelectedBackgroundView.swift
//  Rick-and-Morty
//
//  Created by Kanat on 15.01.2021.
//

import UIKit

extension UITableViewCell {
    func setSelectedBackgroundView(with color: UIColor?) {
        let view = UIView()
        view.backgroundColor = color
        selectedBackgroundView = view
    }
}
