//
//  Processor.swift
//  Calculator
//
//  Created by instructor on 10/5/16.
//  Copyright © 2016 Academy of Arts. All rights reserved.
//

import Foundation

class Processor {

    enum Operation {
        case Constant(Double)
        case UniaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    let operations = [
        "%": Operation.BinaryOperation({$0 % $1}),
        "+": Operation.BinaryOperation({$0 + $1}),
        "-": Operation.BinaryOperation({$0 - $1}),
        "×": Operation.BinaryOperation({$0 * $1}),
        "÷": Operation.BinaryOperation({$0 / $1}),
        "√": Operation.UniaryOperation({sqrt($0)}),
        "C": Operation.Constant(0.0),
        "=": Operation.Equals,
        
    ]
}
