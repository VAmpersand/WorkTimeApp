//
//  BaseViewController.swift
//  UIComponents
//
//  Created by Viktor Prikolota on 27.03.2023.
//

import UIKit

open class BaseViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

extension BaseViewController {
    @objc open func setup() {}
}
