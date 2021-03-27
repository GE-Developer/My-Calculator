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
    private var valueOne = "0"
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        operationLabel.text = valueOne
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
        if !valueOne.contains(".") && valueOne != "" || valueOne == "0" {
            valueOne += "."
            showOperationLabel()
        }
    }
    
    @IBAction func acButtonPressed() {
        valueOne = "0"
        showOperationLabel()
    }
    
    @IBAction func plusMinusButtonPressed() {
        if let i = Double(valueOne) {
            valueOne = String(i * -1)
        }
        showOperationLabel()
    }
    
    @IBAction func percentButtonPressed() {
        if let i = Double(valueOne) {
            valueOne = String(i / 100)
        }
        showOperationLabel()
    }
    
    
    
    
    
    // MARK: - Private Methods
    private func showOperationLabel() {
        operationLabel.text = valueOne
    }
    
    private func zeroCheck(andAdd symbol: String) {
        if valueOne != "0" {
            valueOne += symbol
        } else if valueOne == "0" {
            valueOne = symbol
        }
    }
    
}
