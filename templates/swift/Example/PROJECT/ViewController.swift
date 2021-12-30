//
//  ViewController.swift
//  PROJECT_Example
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var label: UILabel = {
        let label = UILabel.init()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        label.center = self.view.center
        label.text = "PROJECT 组件"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.green
        label.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupUI()
    }

    func setupUI() {
        self.view.addSubview(self.label)
    }
}

