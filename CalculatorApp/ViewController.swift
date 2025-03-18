//
//  ViewController.swift
//  CalculatorApp
//
//  Created by ELİF ÇAĞIL on 16.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var resultLabel: UILabel!
    
    var currentNumber: String = ""
    var firstOperand : Double?
    var secondOperand : Double?
    var operation : String?
    var result : Double?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberTapped(_ sender: UIButton) {
        
        if let number = sender.titleLabel?.text {
            currentNumber += number
            descriptionLabel.text! += currentNumber
            resultLabel.text = currentNumber.isEmpty ? "0" : currentNumber
        }
    }
    
    @IBAction func operationTapped(_ sender: UIButton) {
        if let whichoperation = sender.titleLabel?.text{
            
            
            operation = whichoperation
            descriptionLabel.text! += " \(whichoperation)"


                    if ["√", "±"].contains(whichoperation) {
                        if let number = Double(currentNumber) {
                            unaryoperation(a: number)
                        }
                    } else {
                        if !currentNumber.isEmpty {
                            firstOperand = Double(currentNumber)
                            currentNumber = ""
                        }
                    }
                }
            }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let number = Double(currentNumber),let operation = operation {
            
            if ["+", "-", "x", "÷", "%"].contains(operation) {
                if let firstValue = firstOperand{
                    binaryoperation(a: firstValue, b: number)
                }
            }
        }
    }
    
    func binaryoperation(a:Double,b:Double){
        
        if let whichoperation = operation{
            
            switch whichoperation{
                
            case "+": result = a + b
            case "-": result = a - b
            case "x": result = a * b
            case "÷": result = a/b
            case "%": result = (a*b)/100
            default:
                break
            }
            
            if let lastresult = result {
                resultLabel.text = "\(lastresult)"
                descriptionLabel.text = "\(a) \(whichoperation) \(b)"
            } else {
                resultLabel.text = "Error"
            }
            
            currentNumber = ""
            firstOperand = nil
            operation = nil
            
        }
    }
    
    func unaryoperation(a : Double){
        if let whichoperation = operation{
            switch whichoperation {
                
            case "√":result = a >= 0 ? sqrt(a) : nil
            case "±":result = -a
            default:
                break
            }
            
            if let lastresult = result {
                        resultLabel.text = "\(lastresult)"
                descriptionLabel.text = "\(whichoperation)(\(a))"
                    } else {
                        resultLabel.text = "Error"
                    }
            operation = nil
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        if !(resultLabel.text?.isEmpty ?? true){
            resultLabel.text = ""
            descriptionLabel.text = ""
            currentNumber = ""
    }
  }
}
