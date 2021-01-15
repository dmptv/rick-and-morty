//
//  ActionSheetSegue.swift
//  Rick-and-Morty
//
//  Created by Kanat on 15.01.2021.
//

import SwiftMessages
import UIKit

final class ActionSheetSegue: SwiftMessagesSegue {
    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        super.init(identifier: identifier, source: source, destination: destination)
        configure(layout: .bottomCard)
        containerView.cornerRadius = 12
        dimMode = .color(color: UIColor.black.withAlphaComponent(0.64), interactive: true)
        messageView.layoutMarginAdditions = UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8)
        messageView.configureNoDropShadow()
    }
}
