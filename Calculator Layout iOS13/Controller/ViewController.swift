//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue : Double {
        get{
            guard let number = Double(displayLabel.text!) else{
                fatalError("imposible ")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private var calculator = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber=true
        
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
           // let calculator = CalculatorLogic(number: displayValue)
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
            
            
        }
            
    }
    
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }else {
                
                if numValue == "." {
           
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text?.append(numValue)
            }
            
        }
    }
}

