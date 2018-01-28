//
//  ViewController.swift
//  simple-calc-iOS
//
//  Created by Jerry Li on 1/27/18.
//  Copyright © 2018 Jerry Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ioTextField: UITextField!
    
//    @IBOutlet weak var btnOne: UIButton!
//    @IBOutlet weak var btnTwo: UIButton!
//    @IBOutlet weak var btnThree: UIButton!
//    @IBOutlet weak var btnFour: UIButton!
//    @IBOutlet weak var btnFive: UIButton!
//    @IBOutlet weak var btnSix: UIButton!
//    @IBOutlet weak var btnSeven: UIButton!
//    @IBOutlet weak var btnEight: UIButton!
//    @IBOutlet weak var btnNine: UIButton!
//    @IBOutlet weak var btnZero: UIButton!
//    @IBOutlet weak var btnPlus: UIButton!
//    @IBOutlet weak var btnMinus: UIButton!
//    @IBOutlet weak var btnMultiply: UIButton!
//    @IBOutlet weak var btnDivide: UIButton!
//    @IBOutlet weak var btnCount: UIButton!
//    @IBOutlet weak var btnAvg: UIButton!
//    @IBOutlet weak var btnFact: UIButton!
//    @IBOutlet weak var btnEquals: UIButton!
//    @IBOutlet weak var btnClear: UIButton!
//    @IBOutlet weak var btnMod: UIButton!
    
    var combinedDisplay : String = "" {
        didSet{
            ioTextField.text = combinedDisplay
        }
    }
    var numberBuilder : String = ""
    var numbers: [Int] = []
    var op: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedOne(_ sender: UIButton) {
        appender("1")
    }
    
    @IBAction func pressedTwo(_ sender: UIButton) {
        appender("2")
    }
    
    @IBAction func pressedThree(_ sender: UIButton) {
        appender("3")
    }
    
    @IBAction func pressedFour(_ sender: UIButton) {
        appender("4")
    }
    
    @IBAction func pressedFive(_ sender: UIButton) {
        appender("5")
    }
    
    @IBAction func pressedSix(_ sender: UIButton) {
        appender("6")
    }
    
    @IBAction func pressedSeven(_ sender: UIButton) {
        appender("7")
    }
    
    @IBAction func pressedEight(_ sender: UIButton) {
        appender("8")
    }
 
    @IBAction func pressedNine(_ sender: UIButton) {
        appender("9")
    }
    
    @IBAction func pressedZero(_ sender: UIButton) {
        appender("0")
    }
    
    @IBAction func handleAdd(_ sender: UIButton) {
        if(op == "" && !numberBuilder.isEmpty){
            numComplete()
            combinedDisplay.append(" + ")
            op = "+"
        }
    }
    
    @IBAction func handleSub(_ sender: UIButton) {
        if(op == "" && !numberBuilder.isEmpty){
            numComplete()
            combinedDisplay.append(" - ")
            op = "-"
        }
    }
    
    @IBAction func handleTimes(_ sender: UIButton) {
        if(op == "" && !numberBuilder.isEmpty){
            numComplete()
            combinedDisplay.append(" * ")
            op = "*"
        }
    }
    
    @IBAction func handleDivide(_ sender: UIButton) {
        if(op == "" && !numberBuilder.isEmpty){
            numComplete()
            combinedDisplay.append(" / ")
            op = "/"
        }
    }
    
    @IBAction func handleMod(_ sender: UIButton) {
        if(op == "" && !numberBuilder.isEmpty){
            numComplete()
            combinedDisplay.append(" % ")
            op = "%"
        }
    }
    
    
    @IBAction func handleCount(_ sender: UIButton) {
        if((op == "" || op == "count") && !numberBuilder.isEmpty){
            numComplete()
            combinedDisplay.append(" count ")
            op = "count"
        }
    }
    
    @IBAction func handleAvg(_ sender: UIButton) {
        if((op == "" || op == "avg") && !numberBuilder.isEmpty){
            numComplete()
            combinedDisplay.append(" avg ")
            op = "avg"
        }
    }
    
    
    @IBAction func handleFact(_ sender: UIButton) {
        if(op == "" && !numberBuilder.isEmpty){
            numComplete()
            combinedDisplay.append(" fact ")
            op = "fact"
        }
    }
    
    @IBAction func handleClear(_ sender: UIButton) {
        reset()
    }
    
    
    func numComplete (){
        numbers.append(Int(numberBuilder) ?? 0)
        numberBuilder = ""
    }
    
    func appender(_ s: String){
        numberBuilder.append(s)
        combinedDisplay.append(s)
    }
    
    func reset(){
        combinedDisplay = ""
        numberBuilder = ""
        op = ""
        numbers = []
    }
    
    @IBAction func handleCalc(_ sender: UIButton) {
        if(!numberBuilder.isEmpty){
            numComplete()
        }
        switch op{
        case "+":
            let sum = numbers[0] + numbers[1]
            print(sum)
            combinedDisplay = String(sum)
            numberBuilder = String(sum)
            numbers = []
            op = ""
        case "-":
            let sub = numbers[0] - numbers[1]
            print(sub)
            combinedDisplay = String(sub)
            numberBuilder = String(sub)
            numbers = []
            op = ""
        case "*":
            let times = numbers[0] * numbers[1]
            print(times)
            combinedDisplay = String(times)
            numberBuilder = String(times)
            numbers = []
            op = ""
        case "/":
            if(numbers[1] == 0){
                let alert = UIAlertController(title: "Error", message: "Can not divide by zero", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`))
                self.present(alert, animated: true, completion: nil)
                reset()
            }else{
                let divide = numbers[0] / numbers[1]
                print(divide)
                combinedDisplay = String(divide)
                numberBuilder = String(divide)
                numbers = []
                op = ""
            }
        case "%":
            let mod = numbers[0] % numbers[1]
            print(mod)
            combinedDisplay = String(mod)
            numberBuilder = String(mod)
            numbers = []
            op = ""
        case "count":
            let count = numbers.count
            reset()
            combinedDisplay = String(count)
            numberBuilder = String(count)
        case "avg":
            let count = numbers.count
            var sum = 0
            numbers.forEach({ number in
                sum += number
            })
            let avg = sum/count
            reset()
            combinedDisplay = String(avg)
            numberBuilder = String(avg)
        case "fact":
            if(numbers[0] > 20){
                reset()
            }else{
                var fact = 1
                for i in 1...numbers[0]{
                    fact *= i
                }
                reset()
                combinedDisplay = String(fact)
                numberBuilder = String(fact)
            }
        default: return
        }
    }

}

