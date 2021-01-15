//  TabbarController.swift
//  Test-Project
//
//  Created by Kanat on 12.01.2021.
//

import UIKit

// swiftlint:disable all
protocol TabbarControllerDelegate: class {
    func onCharactersFlowSelect(_ viewController: BaseNavigationController)
    func onEpisodesFlowSelect(_ viewController: BaseNavigationController)
}

final class TabbarController: UITabBarController, UITabBarControllerDelegate {
    private weak var navigationDelegate: TabbarControllerDelegate?
    
    init(viewControllers: [UIViewController], navigationDelegate: TabbarControllerDelegate) {
        self.navigationDelegate = navigationDelegate
        super.init(nibName: nil, bundle: nil)
        
        viewControllers.forEach { baseVC in
            guard let base = baseVC as? BaseNavigationController else { return }
            let regularTextConfig = UIImage.SymbolConfiguration(textStyle: .title3)

            if let charVC = base.topViewController as? CharactersViewController {
                charVC.tabBarItem = UITabBarItem.init(title: "Characters", image: UIImage(systemName: "figure.walk.circle", withConfiguration: regularTextConfig), selectedImage: UIImage(systemName: "figure.walk.circle.fill", withConfiguration: regularTextConfig))
            }
            
            if let episVC = base.topViewController as? EpisodesViewController {
                episVC.tabBarItem = UITabBarItem.init(title: "Episodes", image: UIImage(systemName: "play.tv", withConfiguration: regularTextConfig), selectedImage: UIImage(systemName: "play.tv.fill", withConfiguration: regularTextConfig))
            }
        }
        
        self.viewControllers = viewControllers
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        customizableViewControllers = [UIViewController(), UIViewController(), UIViewController()]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? BaseNavigationController else { return }
        
        if selectedIndex == 0 {
            navigationDelegate?.onCharactersFlowSelect(controller)
        } else if selectedIndex == 1 {
            navigationDelegate?.onEpisodesFlowSelect(controller)
        } else if selectedIndex == 2 {
            
        }
        
    }
}
