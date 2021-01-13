//
//  BaseViewController.swift
//  Test-Project
//
//  Created by Kanat on 05.01.2021.
//

import UIKit

class BaseViewController: UIViewController {
    override var prefersStatusBarHidden: Bool { false }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}
