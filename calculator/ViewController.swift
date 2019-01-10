//
//  ViewController.swift
//  calculator
//
//  Created by Ana Freitas Sampaio on 1/8/19.
//  Copyright © 2019 Ana Caroline Freitas Sampaio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var allClear: UIButton!
    @IBOutlet weak var percentage: UIButton!
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
    }
    
    @IBAction func numberClicked(_ sender: UIButton) {
        if labelResult.text == "0" {
            labelResult.text = sender.titleLabel?.text
        } else {
            if let numberLabel = sender.titleLabel?.text {
                labelResult.text?.append(numberLabel)
            }
        }
    }
    
    
}

