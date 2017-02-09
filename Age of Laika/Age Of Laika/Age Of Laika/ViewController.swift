//
//  ViewController.swift
//  Age Of Laika
//
//  Created by Wilson Ding on 1/1/15.
//  Copyright (c) 2015 Wilson Ding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var humanYearsTextField: UITextField!
    @IBOutlet weak var dogYearsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertButton(sender: UIButton) {
        let convertConstant = 7
        
        var convertedYear = humanYearsTextField.text.toInt()!
        convertedYear *= convertConstant
        dogYearsLabel.hidden = false
        dogYearsLabel.text = "\(convertedYear)" + " dog years old."
    }

    @IBAction func convertRealButton(sender: UIButton) {
        let convertFirstConstant = 10.5
        let convertSecondConstant = 4.0
        let constantYear = humanYearsTextField.text.toInt()!
        
        var convertedRealYear = 0.0
        
        if constantYear > 2{
            convertedRealYear = (2.0 * convertFirstConstant) + ((Double(constantYear) - 2.0) * convertSecondConstant)
        }
        
        else {
            convertedRealYear = Double(constantYear) * convertFirstConstant
        }
        
        dogYearsLabel.hidden = false
        dogYearsLabel.text = "\(convertedRealYear)" + " real dog years old."
    }
}

