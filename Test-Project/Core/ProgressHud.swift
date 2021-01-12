//
//  ProgressHud.swift
//  Test-Project
//
//  Created by Kanat on 12.01.2021.
//

import UIKit

private enum Constants {
    static let animationDuration: TimeInterval = 0.25
}

final class ProgressHud {
    private static var containerView: ProgressHudContainerView = {
        let containerView = ProgressHudContainerView.loadFromNib()
        containerView.alpha = 0.0
        return containerView
    }()

    static func startAnimating() {
        let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
        guard let window = keyWindow else { return }
        if !window.subviews.contains(containerView) {
            addContainerView(to: window)
        }

        window.endEditing(true)
        UIView.animate(withDuration: Constants.animationDuration,
                       animations: { self.containerView.alpha = 1.0 },
                       completion: { _ in self.containerView.startAnimating() })
    }

    static func stopAnimating() {
        let completion: (Bool) -> Void = { _ in
            self.containerView.removeFromSuperview()
            self.containerView.stopAnimating()
        }
        UIView.animate(withDuration: Constants.animationDuration,
                       animations: { self.containerView.alpha = 0.0 },
                       completion: completion)
    }

    private static func addContainerView(to window: UIWindow) {
        containerView.frame = CGRect(origin: .zero, size: window.frame.size)
        window.addSubview(containerView)
    }
}
