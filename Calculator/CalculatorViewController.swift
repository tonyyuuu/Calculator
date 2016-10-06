//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by instructor on 9/28/16.
//  Copyright © 2016 Academy of Arts. All rights reserved.
//

import Foundation
import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
    }
    var previousValue: Double = 0
    var currentOperation: String?
    var hasStartedTyping = false
    
    func calculate(operand1: Double, operand2: Double, operation: String) -> Double {
        switch operation {
        case "+": return operand1 + operand2
        case "-": return operand1 - operand2
        case "×": return operand1 * operand2
        case "÷":
            if operand2 != 0 {
                return operand1 / operand2
            } else {
                return 0
            }
        default: return 0
        }
    }
    
    @IBAction func tapOperation(sender: UIButton) {
        switch sender.currentTitle! {
        case "+":
            if currentOperation != nil {
                let result = calculate(previousValue, operand2: displayValue, operation: currentOperation!)
                display.text = String(result)
            }
            previousValue = displayValue
            currentOperation = "+"
            hasStartedTyping = false
        case "-":
            if currentOperation != nil {
                let result = calculate(previousValue, operand2: displayValue, operation: currentOperation!)
                display.text = String(result)
            }
            previousValue = displayValue
            currentOperation = "-"
            hasStartedTyping = false
        case "×":
            if currentOperation != nil {
                let result = calculate(previousValue, operand2: displayValue, operation: currentOperation!)
                display.text = String(result)
            }
            previousValue = displayValue
            currentOperation = "×"
            hasStartedTyping = false
        case "÷":
            if currentOperation != nil {
                let result = calculate(previousValue, operand2: displayValue, operation: currentOperation!)
                display.text = String(result)
            }
            previousValue = displayValue
            currentOperation = "÷"
            hasStartedTyping = false
        case "√": display.text = String(sqrt(displayValue))
        case "=":
            if currentOperation != nil {
                let result = calculate(previousValue, operand2: displayValue, operation: currentOperation!)
                display.text = String(result)
            }
            currentOperation = nil
            hasStartedTyping = false
        default: break
        }
    }
    
    @IBAction func tapNumber(sender: UIButton) {
        if hasStartedTyping {
            display.text = display.text! + sender.currentTitle!
        } else if (display.text! != "0" || sender.currentTitle! != "0") {
            display.text = sender.currentTitle!
            hasStartedTyping = true
        }
        
    }

}
