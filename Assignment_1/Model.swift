//
//  Model.swift
//  Assignment_1
//
//  Created by Tsz Kit Cheung on 2023-09-22.
//

import Foundation


class calculatorFunc{
    
    static var outputArray: [String] = []
    
    static func push(input: Int?) -> [String] {
        
        switch input {
        case 11:
            (outputArray.append("+"))
        case 12:
            (outputArray.append("-"))
        case 13:
            (outputArray.append("*"))
        case 14:
            (outputArray.append("/"))
        case 15:
            outputArray = []
        default:
            (outputArray.append("\(input!)"))
            }
        
//        outputArray.append("\(input!)")
        
        return outputArray
    }
    
    
    static func calculate(inputArray: [String]?) -> (result: Int?, errorMessage: String?) {
        
        // check array is nil or not
        guard let inputArray = inputArray, !inputArray.isEmpty else {
            return (nil, "Error!")
        }
        
        var operatorCounter: Int = 0
        let operators = ["+", "-", "*", "/"]
        
        // If operator !=1, error
        // If front or end of array is operator, error
        for (index, element) in inputArray.enumerated() {
            if operators.contains(element) {
                operatorCounter += 1
                if (index == 0 || index == inputArray.count - 1) {
                    return (nil, "Error!")
                }
            }
        }
        
        print(operatorCounter)
        
        // use guard to ensure only 1 operator
        guard operatorCounter == 1 else {
            return (nil, "Error!")
        }
        
        // split array
        // variables
        var firstNumArray: [String] = []
        var secondNumArray: [String] = []
        var operatorLocation: Int = 0
        var operatorUsed: String = ""
        
        // locate the operator and make 2 number arrays
        for (index, element) in inputArray.enumerated() {
            if operators.contains(element) {
                operatorLocation = index
                operatorUsed = element
            }
            else if operatorLocation > 0 {
                secondNumArray.append(element)
            }
            else{
                firstNumArray.append(element)
            }
        }
        
        print("First Array:\(firstNumArray) \nSecond Array:\(secondNumArray) \noperator \(operatorUsed)\n")
        
        // convert to Number
        let firstNumString = firstNumArray.joined()
        let firstNum = Int(firstNumString)
        let secondNumString = secondNumArray.joined()
        let secondNum = Int(secondNumString)
        
        print("First number:\(firstNum!) \nSecond number:\(secondNum!)\n")
        
        // perform calculation
        switch operatorUsed{
        case "+":
            return ((firstNum! + secondNum!), nil)
        case "-":
            return ((firstNum! - secondNum!), nil)
        case "*":
            return ((firstNum! * secondNum!), nil)
        case "/":
            // raise error when divide by 0
            guard secondNum! != 0 else {
                return (nil, "Error!")
            }
            return ((firstNum! / secondNum!), nil)
        default:
            return (nil, "Error!")
        }
        
    }
}
