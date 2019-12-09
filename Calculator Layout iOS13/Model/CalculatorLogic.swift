//
//  CalculatorLogic.swift
//  Calculator Layout iOS13
//
//  Created by José Javier Cueto Mejía on 08/12/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic{
    
    private var number: Double?
    
    private var intermidiateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }

    mutating func calculate(symbol: String) -> Double?{
        
        // chage to switch 
        if let n = number{
            if symbol == "+/-" {
                return n * -1.0
            }else if(symbol == "AC" ){
                return 0
            }else if(symbol == "%" ){
                return n * 0.01
            }else if(symbol == "=" ){
                return performTwoNumCalculation(n2: n)
            }else{
                intermidiateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        
        
        return nil
    }
    
    private mutating func performTwoNumCalculation(n2: Double) -> Double?{
        if let n1 = intermidiateCalculation?.n1, let operation = intermidiateCalculation?.calcMethod{
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("la operacion no se pudo completar")
            }
        }
        
        return nil
    }
}

