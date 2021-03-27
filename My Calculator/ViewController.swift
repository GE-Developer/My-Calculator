//
//  ViewController.swift
//  My Calculator
//
//  Created by Mikhail Bukhrashvili on 27.03.2021.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var operationLabel: UILabel!
    
    @IBOutlet var zeroButton: UIButton!
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var fourButton: UIButton!
    @IBOutlet var fiveButton: UIButton!
    @IBOutlet var sixButton: UIButton!
    @IBOutlet var sevenButton: UIButton!
    @IBOutlet var eightButton: UIButton!
    @IBOutlet var nineButton: UIButton!

    @IBOutlet var dotButton: UIButton!
    @IBOutlet var acButton: UIButton!
    @IBOutlet var plusMinusButton: UIButton!
    @IBOutlet var percentButton: UIButton!
    
    @IBOutlet var divButton: UIButton!
    @IBOutlet var multButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    
    @IBOutlet var equalButton: UIButton!
    
    // MARK: - Private Properties
    private var value = "0"
    private var valueOne = "0"
    private var valueTwo = "0"
    private var oper = "/"
    private var percent = false
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        operationLabel.text = value
    }
    
    override func viewWillLayoutSubviews() {
        for button in [zeroButton ,oneButton, twoButton,
                       threeButton, fourButton, fiveButton,
                       sixButton, sevenButton, eightButton,
                       nineButton, dotButton, acButton,
                       plusMinusButton, percentButton, divButton,
                       multButton, minusButton, plusButton,
                       equalButton] {
            button!.layer.cornerRadius = (button!.frame.height) / 2
        }
    }
    
    // MARK: - IB Actions
    @IBAction func zeroButtonPressed() {
        zeroCheck(andAdd: "0")
        showOperationLabel()
    }
    
    @IBAction func oneButtonPressed() {
        zeroCheck(andAdd: "1")
        showOperationLabel()
    }
    
    @IBAction func twoButtonPressed() {
        zeroCheck(andAdd: "2")
        showOperationLabel()
    }
    
    @IBAction func threeButtonPressed() {
        zeroCheck(andAdd: "3")
        showOperationLabel()
    }
    
    @IBAction func fourButtonPressed() {
        zeroCheck(andAdd: "4")
        showOperationLabel()
    }
    
    @IBAction func fiveButtonPressed() {
        zeroCheck(andAdd: "5")
        showOperationLabel()
    }
    
    @IBAction func sixButtonPressed() {
        zeroCheck(andAdd: "6")
        showOperationLabel()
    }
    
    @IBAction func sevenButtonPressed() {
        zeroCheck(andAdd: "7")
        showOperationLabel()
    }
    
    @IBAction func eightButtonPressed() {
        zeroCheck(andAdd: "8")
        showOperationLabel()
    }
    
    @IBAction func nineButtonPressed() {
        zeroCheck(andAdd: "9")
        showOperationLabel()
    }
    
    @IBAction func dotButtonPressed() {
        if !value.contains(".") && value != "" || value == "0" {
            value += "."
            showOperationLabel()
        }
    }
    
    @IBAction func acButtonPressed() {
        value = "0"
        showOperationLabel()
    }
    
    @IBAction func plusMinusButtonPressed() {
        if let symbol = Double(value) {
            value = String(symbol * -1)
        }
        showOperationLabel()
    }
    
    @IBAction func percentButtonPressed() {
        if value != "0" {
            switch valueOne {
            case "0":
                if let symbol = Double(value) {
                    value = String(symbol / 100)
                }
            default:
                percent = true
            }
        }
        showOperationLabel()
        
    }
    
    @IBAction func divButtonPressed() {
        operation()
        oper = "/"
    }
    
    @IBAction func multButtonPressed() {
        operation()
        oper = "*"
    }
    
    @IBAction func minusButtonPressed() {
        operation()
        oper = "-"
    }
    
    @IBAction func plusButtonPressed() {
        operation()
        oper = "+"
    }
    
    @IBAction func equalButtonPressed() {
        valueTwo = value
        
        if let symbolOne = Double(valueOne),
           let symbolTwo = Double(valueTwo) {
            
            switch oper {
            case "/" where symbolTwo != 0:
                value = String(symbolOne / symbolTwo)
                oper = ""
            case "/" where symbolTwo == 0:
                value = "Это error (:"
                oper = ""
            case "*":
                value = String(symbolOne * symbolTwo)
                oper = ""
            case "-":
                if percent {
                    value = String(symbolOne - symbolOne * symbolTwo / 100)
                    percent = false
                } else {
                    value = String(symbolOne - symbolTwo)
                }
                oper = ""
            case "+":
                if percent {
                    value = String(symbolOne + symbolOne * symbolTwo / 100)
                    percent = false
                } else {
                    value = String(symbolOne + symbolTwo)
                }
                oper = ""
            default:
                break
            }
        }
        
        showOperationLabel()
        valueOne = "0"
        valueTwo = "0"
    }
    
    // MARK: - Private Methods
    private func showOperationLabel() {
        operationLabel.text = value
    }
    
    private func zeroCheck(andAdd symbol: String) {
        if value != "0" {
            value += symbol
        } else if value == "0" {
            value = symbol
        }
    }
    
    private func operation() {
        valueOne = value
        value = "0"
    }
    
}
