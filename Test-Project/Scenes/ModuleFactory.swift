//
//  ModuleFactory.swift
//  Test-Project
//
//  Created by Kanat on 05.01.2021.
//

import Swinject
import UIKit

final class ModuleFactory {
    private let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    func makeTabbar(viewControllers: [UIViewController], navigationDelegate: TabbarControllerDelegate) -> UIViewController {
        let controller = TabbarController(viewControllers: viewControllers, navigationDelegate: navigationDelegate)
        return controller
    }
    
}
