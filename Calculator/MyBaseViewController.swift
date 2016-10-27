//
//  MyBaseViewController.swift
//  Calculator
//
//  Created by dongbei yu on 10/12/16.
//  Copyright © 2016 Academy of Arts. All rights reserved.
//

import UIKit

class MyBaseViewController: UIViewController {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

}
