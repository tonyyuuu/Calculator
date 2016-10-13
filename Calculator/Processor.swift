//
//  Processor.swift
//  Calculator
//
//  Created by instructor on 10/5/16.
//  Copyright © 2016 Academy of Arts. All rights reserved.
//

import Foundation

class Processor {
    
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
            accumulator = pendingOperation!.binaryFunction(pendingOperation!.firstOperand,
                                                           accumulator)
            pendingOperation = nil
        }
    }
    
    func addOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value): accumulator = value
            case .UniaryOperation(let f):
                accumulator = f(accumulator)
            case .BinaryOperation(let f):
                executePendingOperation()
                pendingOperation = PendingBinaryOperationInfo(binaryFunction: f, firstOperand: accumulator)
            case .Equals:
                executePendingOperation()
            }
        }
    }

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
