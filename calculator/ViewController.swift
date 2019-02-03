//
//  ViewController.swift
//  calculator
//
//  Created by Ana Freitas Sampaio on 1/8/19.
//  Copyright © 2019 Ana Caroline Freitas Sampaio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberWasClicked: Bool = false
    var a: Double = 0
    var b: Double?
    enum OperationNames: String {
        case sum
        case subtract
        case multiply
        case divide
        case equals
        case percent
    }
    var lastOperation: OperationNames?
    
    @IBOutlet weak var allClear: UIButton!
    @IBOutlet weak var percent: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var subtract: UIButton!
    @IBOutlet weak var sum: UIButton!
    @IBOutlet weak var equals: UIButton!
    @IBOutlet weak var dot: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var labelResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allClear(self)
    }

    @IBAction func allClear(_ sender: Any) {
        labelResult.text = "0"
        a = 0
        b = nil
        numberWasClicked = false
    }
    
    @IBAction func numberClicked(_ sender: UIButton) {
        
        if labelResult.text == "0" || !numberWasClicked {
            labelResult.text = sender.titleLabel?.text
            if lastOperation == .equals {
                a = 0
            }
        } else {
            if let numberLabel = sender.titleLabel?.text {
                labelResult.text?.append(numberLabel)
            }
        }
        numberWasClicked = true
        
    }
    
    @IBAction func operation(_ sender: UIButton) {
        if numberWasClicked {
            numberWasClicked = false
            if a == 0 {
                if let temp: String = labelResult.text {
                    a = Double(temp)!
                } else {
                    return
                }
            } else {
                if b == nil {
                    if let temp: String = labelResult.text {
                        b = Double(temp)!
                    } else {
                        return
                    }
                    switch lastOperation {
                    case .sum? :
                        a = a + b!
                    case .subtract?:
                        a = a - b!
                    case .multiply?:
                        a = a * b!
                    case .divide?:
                        if b != 0 {
                            a = a / b!
                        } else {
                            b = nil
                            labelResult.text = "Not a number"
                            return
                        }
                    default:
                        print("There is no operation")
                    }
                    labelResult.text = String(a)
                    b = nil
                }
            }
        }
        switch sender {
        case sum:
            lastOperation = .sum
        case subtract:
            lastOperation = .subtract
        case multiply:
            lastOperation = .multiply
        case divide:
            lastOperation = .divide
        case equals:
            lastOperation = .equals
        case percent:
            lastOperation = .percent
            a = a / 100
            labelResult.text = String(a)
        default:
            lastOperation = .none
        }
    }
    
    @IBAction func dotClicked() {
        if !numberWasClicked {
            labelResult.text = "0"
        }
        let displayText = labelResult?.text
        if displayText!.contains(".") {
            return
        } else {
            labelResult.text?.append(".")
            numberWasClicked = true
        }
    }
}

