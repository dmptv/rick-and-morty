//
//  ProgressHudContainerView.swift
//  Test-Project
//
//  Created by Kanat on 12.01.2021.
//

import MaterialComponents.MaterialActivityIndicator
import UIKit

final class ProgressHudContainerView: UIView, NibLoadable {

    @IBOutlet private var backgroundView: UIView!
    @IBOutlet private var activityIndicator: MDCActivityIndicator!

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    func startAnimating() {
        activityIndicator.startAnimating()
    }

    func stopAnimating() {
        activityIndicator.stopAnimating()
    }

    private func setup() {
        activityIndicator.radius = 24
        activityIndicator.strokeWidth = 3
        updateColors()
    }

    private func updateColors() {
        backgroundView.backgroundColor = UIColor(red: 0.067, green: 0.067, blue: 0.078, alpha: 0.64)
        activityIndicator.cycleColors = [UIColor.white, .orange, .cyan, .blue]
    }
    

}
