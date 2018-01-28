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
    
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    @IBOutlet weak var btnFive: UIButton!
    @IBOutlet weak var btnSix: UIButton!
    @IBOutlet weak var btnSeven: UIButton!
    @IBOutlet weak var btnEight: UIButton!
    @IBOutlet weak var btnNine: UIButton!
    @IBOutlet weak var btnZero: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet weak var btnCount: UIButton!
    @IBOutlet weak var btnAvg: UIButton!
    @IBOutlet weak var btnFact: UIButton!
    @IBOutlet weak var btnEquals: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func prventErrorOp(_ clicked: UIButton){
        if(btnAvg != clicked){
            btnAvg.isEnabled = false
        }
        if(btnCount != clicked){
            btnCount.isEnabled = false
        }
        
        btnFact.isEnabled = false
    }

    @IBAction func handleClear(_ sender: UIButton) {
        btnCount.isEnabled = true
        btnAvg.isEnabled = true
        btnFact.isEnabled = true
        ioTextField.text = ""
    }
    
}

