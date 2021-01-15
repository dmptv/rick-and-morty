//
//  ActionSheetItem.swift
//  Rick-and-Morty
//
//  Created by Kanat on 15.01.2021.
//

import Foundation

final class ActionSheetItem {
    let title: String
    let completion: (() -> Void)?

    init(title: String, completion: (() -> Void)? = nil) {
        self.title = title
        self.completion = completion
    }
}
