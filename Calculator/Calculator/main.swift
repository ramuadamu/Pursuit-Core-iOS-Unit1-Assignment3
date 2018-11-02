//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation


var calculatorIsActive = true

//pre-requisites (write map, filter, and reduce functions)

//map
func myMap(inputArray: [Int], closure: (Int) -> Int) -> [Int] {
    var newArr = [Int]()
    for num in inputArray {
        newArr.append(closure(num))
    }
    return newArr
}

//filter
//func myFilter(inputArray: [Int], filter: (Int) -> Bool) -> [Int] {
//
//}

//reduce


func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
    switch opString {
    case "+":
        return {x, y in x + y }
    case "-":
        return {x, y in x - y }
    case "*":
        return {x, y in x * y }
    case "/":
        return {x, y in x / y }
    default:
        return {x, y in x + y }
    }
}

// "*" is coming from the user's input from readLine()
// e.g user enters 5 * 6
// we need to separate string into components
// e.g [5, *, 6]

while calculatorIsActive {
    print("please enter type of calculation, 1 (basic) or 2 (high order)?")
    let userInput = readLine()!
    
    guard let userChoice = Int(userInput) else  {
        print("That's not a valid choice. It needs to be an integer")
        continue
    }
    
    switch userChoice {
    case 1:
        print("enter your operation, e.g: 4 * 5")
        let userInput = readLine()!
        let components = userInput.components(separatedBy: " ")
        print(components)
        if components.count != 3 {
            print("you need to follow the format, e.g: 5 + 3")
            continue
        }
        let mathOperation = mathStuffFactory(opString: components[1])
        
        // calculate result using closure returned from mathStuffFactory()
        let result = mathOperation(Double(components[0])!,Double(components[2])!)
        print("\(userInput) = \(result)")
    case 2:
        //High order function stuff
        print("You selected high order functions")
        //        break
        print("enter your high order operation, e.g: filter 1,2,6,5,7 by < 4")
        let userInput = readLine()!
        let  _ = userInput.components(separatedBy: " ")
        
        
        
    default:
        print("That's not a valid choice")
        calculatorIsActive = false
    }
    //        print(components)
    //        if components.count != 5 {
    //            print("please refer to the format")
    //            continue
    
    //    default:
    //        print("That's not a valid choice")
    //        calculatorIsActive = false
    //    }
    
}
