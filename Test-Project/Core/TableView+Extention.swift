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
    
    func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: "\(Cell.self)", for: indexPath) as? Cell else {
            fatalError("register(cellClass:) has not been implemented")
        }
        return cell
    }

    func dequeueReusableHeaderFooterView<Cell: UITableViewHeaderFooterView>() -> Cell {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: "\(Cell.self)") as? Cell else {
            fatalError("register(aClass:) has not been implemented")
        }
        return view
    }
}
