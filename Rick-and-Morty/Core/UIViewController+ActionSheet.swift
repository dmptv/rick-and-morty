//
//  UIViewController+ActionSheet.swift
//  Rick-and-Morty
//
//  Created by Kanat on 15.01.2021.
//

import SwiftMessages
import UIKit

extension UIViewController {
    func presentActionSheet(category: ActionSheetCategory = .default, title: String?, message: String?, items: [ActionSheetItem]) {
        let destinationVC = ActionSheetViewController(category: category,
                                                      title: title?.trimmingCharacters(in: .whitespacesAndNewlines),
                                                      message: message?.trimmingCharacters(in: .whitespacesAndNewlines),
                                                      items: items)
        DispatchQueue.main.async {
            ActionSheetSegue(identifier: nil, source: self, destination: destinationVC).perform()
        }
    }
}
