//
//  Processor.swift
//  Calculator
//
//  Created by dongbei yu on 10/5/16.
//  Copyright © 2016 Academy of Arts. All rights reserved.
//

import UIKit

import Foundation

class Processor: NSObject {
    
    var accumulator = 0.0
    
    var result: Double {
        get {
            return accumulator
        }
    }
    
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    var pendingOperation: PendingBinaryOperationInfo?
    
    func executePendingOperation() {
        if pendingOperation != nil {
            accumulator = pendingOperation!.binaryFunction(pendingOperation!.firstOperand,accumulator)
            pendingOperation = nil
        }
    }
    
    func addOperand(_ operand: Double) {
        accumulator = operand
        
    }
    
    func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
                case .Constant(let value): accumulator = value
                case .UniaryOperation(let f):
                    accumulator = f(accumulator)
            case .BinaryOperation(let f):
                executePendingOperation()
                pendingOperation = PendingBinaryOperationInfo(binaryFunction: f, firstOperand: accumulator)
                case .Equals:
                    break;
            }
        }
        
    }
    
    enum Operation {
        case Constant(Double)
        case UniaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
//    func add(x: Double, y:Double) -> Double {
//        
//    }
    
    let operations = [
        "%": Operation.BinaryOperation({$0.truncatingRemainder(dividingBy: $1)}),
        "C": Operation.Constant(0.0),
        "+": Operation.BinaryOperation({$0 + $1}),
        "-": Operation.BinaryOperation({$0 - $1}),
        "×": Operation.BinaryOperation({$0 * $1}),
        "÷": Operation.BinaryOperation({$0 / $1}),
        "=": Operation.Equals,
        //        "×":
        //        "÷":
        //        "√":
    ]
    
}
