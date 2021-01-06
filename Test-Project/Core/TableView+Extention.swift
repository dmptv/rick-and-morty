//
//  TableView+Extention.swift
//  Test-Project
//
//  Created by Kanat on 06.01.2021.
//

import UIKit

extension UITableView {
    func register(cellClass: AnyClass) {
        let nib = UINib(nibName: "\(cellClass)", bundle: Bundle(for: cellClass))
        register(nib, forCellReuseIdentifier: "\(cellClass)")
    }

    func register(aClass: AnyClass) {
        let nib = UINib(nibName: "\(aClass)", bundle: Bundle(for: aClass))
        register(nib, forHeaderFooterViewReuseIdentifier: "\(aClass)")
    }
}
