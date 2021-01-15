//
//  UIViewController+Toast.swift
//  Rick-and-Morty
//
//  Created by Kanat on 15.01.2021.
//

import SwiftMessages
import UIKit

private enum Constants {
    static let leftPadding: CGFloat = 64
    static let rightPadding: CGFloat = 28
    static let oneLineHeight: CGFloat = 20
}

extension UIViewController {
    private var config: SwiftMessages.Config {
        var config = SwiftMessages.defaultConfig
        config.becomeKeyWindow = true
        config.presentationContext = .window(windowLevel: .statusBar)
        config.duration = .seconds(seconds: 2)
        config.presentationStyle = .bottom
        config.keyboardTrackingView = KeyboardTrackingView()
        if #available(iOS 13.0, *) {
            switch AppTheme.current.userInterfaceStyle {
            case .dark:
                config.preferredStatusBarStyle = .lightContent
            case .light:
                config.preferredStatusBarStyle = .darkContent
            default:
                config.preferredStatusBarStyle = .default
            }
        }
        return config
    }

    func showToast(category: ToastCategory, message: String?) {
        showToast(category: category, message: message, completion: ({}))
    }

    func showToast(category: ToastCategory, message: String?, completion: @escaping () -> Void) {
        SwiftMessages.hide(animated: false)
        if shouldShowAsActionSheet(category: category, message: message) {
            presentActionSheet(title: message, message: nil, items: [ActionSheetItem(title: "Close", completion: completion)])
            return
        }
        guard let view: ToastView = try? SwiftMessages.viewFromNib(named: String(describing: ToastView.self),
                                                                   bundle: Bundle(for: BundleToken.self)) else { return }
        view.configure(category: category, message: message?.trimmingCharacters(in: .whitespacesAndNewlines))
        SwiftMessages.show(config: config, view: view)
    }

    private func shouldShowAsActionSheet(category: ToastCategory, message: String?) -> Bool {
        guard category == .error,
            let message = message?.trimmingCharacters(in: .whitespacesAndNewlines) else { return false }
        let width = UIScreen.main.bounds.width - Constants.leftPadding - Constants.rightPadding
        let height = message.height(withConstrainedWidth: width, font: UIFont.systemFont(ofSize: 20))
        return height > Constants.oneLineHeight
    }
}

private final class BundleToken {}
