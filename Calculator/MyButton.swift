//
//  MyButton.swift
//  Calculator
//
//  Created by instructor on 10/5/16.
//  Copyright © 2016 Academy of Arts. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class MyButton: UIButton {
    override func awakeFromNib() {
        self.setupViews()
    }
    override func prepareForInterfaceBuilder() {
        self.setupViews()
    }
    func setupViews() {
        
    }
}
