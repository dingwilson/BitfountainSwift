//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Wilson Ding on 1/17/15.
//  Copyright (c) 2015 Wilson Ding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //UIView
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    //First Container Labels
    var firstYouHaveLabel: UILabel!
    var firstMoneyLabel: UILabel!
    var firstLemonsLabel: UILabel!
    var firstIceLabel: UILabel!
    
    //Second Container Labels
    var secondStepOneLabel: UILabel!
    var secondLemonsLabel: UILabel!
    var secondLemonsPlusButton: UIButton!
    var secondNumLemonsLabel: UILabel!
    var secondLemonsMinusButton: UIButton!
    var secondIceLabel: UILabel!
    var secondIcePlusButton: UIButton!
    var secondNumIceLabel: UILabel!
    var secondIceMinusButton: UIButton!
    
    //Third Container Labels
    var thirdStepTwoLabel: UILabel!
    var thirdQueryLabel: UILabel!
    var thirdLemonsLabel: UILabel!
    var thirdLemonsPlusButton: UIButton!
    var thirdNumLemonsLabel: UILabel!
    var thirdLemonsMinusButton: UIButton!
    var thirdIceLabel: UILabel!
    var thirdIcePlusButton: UIButton!
    var thirdNumIceLabel: UILabel!
    var thirdIceMinusButton: UIButton!
    
    //Fourth Container Labels
    var fourthStepThreeLabel: UILabel!
    var fourthQueryLabel: UILabel!
    var fourthStartButton: UIButton!
    
    //View Constants
    let kHalf:CGFloat = 1.0/2.0
    let kThird:CGFloat = 1.0/3.0
    let kFourth:CGFloat = 1.0/4.0
    let kSixth:CGFloat = 1.0/6.0
    let kEighth:CGFloat = 1.0/8.0
    let kViewConstant:CGFloat = 10.0
    
    //Global Var
    var numMoney = 10
    var numLemon = 1
    var numIce = 1
    
    var numBoughtLemons = 0
    var numBoughtIce = 0
    
    var numUsedLemons = 0
    var numUsedIce = 0
    
    var personArray: [Person] = []
    var ratioLemonade = 0.0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContainerViews()
        setupFirstContainer(firstContainer)
        setupSecondContainer(secondContainer)
        setupThirdContainer(thirdContainer)
        setupFourthContainer(fourthContainer)
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupContainerViews() {
        self.firstContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kViewConstant, y: self.view.bounds.origin.y, width: self.view.bounds.width - (kViewConstant * 2), height: self.view.bounds.height * kFourth))
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kViewConstant, y: firstContainer.bounds.height, width: self.view.bounds.width - (kViewConstant * 2), height: self.view.bounds.height * kFourth))
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kViewConstant, y: firstContainer.bounds.height + secondContainer.bounds.height, width: self.view.bounds.width - (kViewConstant * 2), height: self.view.bounds.height * kFourth))
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kViewConstant, y: firstContainer.bounds.height + secondContainer.bounds.height + thirdContainer.bounds.height, width: self.view.bounds.width - (kViewConstant * 2), height: self.view.bounds.height * kFourth))
        self.view.addSubview(self.fourthContainer)
    }
    
    func setupFirstContainer(containerView: UIView) {
        self.firstYouHaveLabel = UILabel()
        self.firstYouHaveLabel.text = "You Have: "
        self.firstYouHaveLabel.textColor = UIColor.redColor()
        self.firstYouHaveLabel.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.firstYouHaveLabel.sizeToFit()
        self.firstYouHaveLabel.center = CGPoint(x: firstContainer.frame.width * kFourth, y: firstContainer.frame.height * kSixth)
        containerView.addSubview(self.firstYouHaveLabel)
        
        self.firstMoneyLabel = UILabel()
        self.firstMoneyLabel.text = "$\(numMoney)"
        self.firstMoneyLabel.textColor = UIColor.greenColor()
        self.firstMoneyLabel.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.firstMoneyLabel.sizeToFit()
        self.firstMoneyLabel.center = CGPoint(x: firstContainer.frame.width * (kFourth * 2), y: firstContainer.frame.height * kSixth)
        containerView.addSubview(self.firstMoneyLabel)
        
        self.firstLemonsLabel = UILabel()
        self.firstLemonsLabel.text = "\(numLemon) Lemons"
        self.firstLemonsLabel.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.firstLemonsLabel.sizeToFit()
        self.firstLemonsLabel.center = CGPoint(x: firstContainer.frame.width * (kFourth * 2), y: firstContainer.frame.height * (kSixth * 3))
        containerView.addSubview(self.firstLemonsLabel)
        
        self.firstIceLabel = UILabel()
        self.firstIceLabel.text = "\(numIce) Ice Cubes"
        self.firstIceLabel.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.firstIceLabel.sizeToFit()
        self.firstIceLabel.center = CGPoint(x: firstContainer.frame.width * (kFourth * 2), y: firstContainer.frame.height * (kSixth * 5))
        containerView.addSubview(self.firstIceLabel)
    }
    
    func setupSecondContainer(containerView: UIView) {
        self.secondStepOneLabel = UILabel()
        self.secondStepOneLabel.text = "Step 1: Purchase Supplies"
        self.secondStepOneLabel.textColor = UIColor.blueColor()
        self.secondStepOneLabel.font = UIFont(name: "AmericanTypewriter", size: 20)
        self.secondStepOneLabel.sizeToFit()
        self.secondStepOneLabel.center = CGPoint(x: secondContainer.frame.width * kHalf, y: secondContainer.frame.height * kSixth)
        containerView.addSubview(self.secondStepOneLabel)
        
        self.secondLemonsLabel = UILabel()
        self.secondLemonsLabel.text = "Lemons for $2:"
        self.secondLemonsLabel.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.secondLemonsLabel.sizeToFit()
        self.secondLemonsLabel.center = CGPoint(x: secondContainer.frame.width * kFourth, y: secondContainer.frame.height * (kSixth * 3))
        containerView.addSubview(self.secondLemonsLabel)
        
        self.secondLemonsPlusButton = UIButton()
        self.secondLemonsPlusButton.setTitle("+", forState: UIControlState.Normal)
        self.secondLemonsPlusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.secondLemonsPlusButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.secondLemonsPlusButton.sizeToFit()
        self.secondLemonsPlusButton.center = CGPoint(x: secondContainer.frame.width * (kEighth * 5), y: secondContainer.frame.height * (kSixth * 3))
        self.secondLemonsPlusButton.addTarget(self, action: "secondLemonsPlusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.secondLemonsPlusButton)
        
        self.secondNumLemonsLabel = UILabel()
        self.secondNumLemonsLabel.text = "\(numBoughtLemons)"
        self.secondNumLemonsLabel.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.secondNumLemonsLabel.sizeToFit()
        self.secondNumLemonsLabel.center = CGPoint(x: secondContainer.frame.width * (kEighth * 6), y: secondContainer.frame.height * (kSixth * 3))
        containerView.addSubview(secondNumLemonsLabel)
        
        self.secondLemonsMinusButton = UIButton()
        self.secondLemonsMinusButton.setTitle("-", forState: UIControlState.Normal)
        self.secondLemonsMinusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.secondLemonsMinusButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.secondLemonsMinusButton.sizeToFit()
        self.secondLemonsMinusButton.center = CGPoint(x: secondContainer.frame.width * (kEighth * 7), y: secondContainer.frame.height * (kSixth * 3))
        self.secondLemonsMinusButton.addTarget(self, action: "secondLemonsMinusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.secondLemonsMinusButton)
        
        self.secondIceLabel = UILabel()
        self.secondIceLabel.text = "Ice Cubes for $1:"
        self.secondIceLabel.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.secondIceLabel.sizeToFit()
        self.secondIceLabel.center = CGPoint(x: secondContainer.frame.width * kFourth, y: secondContainer.frame.height * (kSixth * 5))
        containerView.addSubview(self.secondIceLabel)
        
        self.secondIcePlusButton = UIButton()
        self.secondIcePlusButton.setTitle("+", forState: UIControlState.Normal)
        self.secondIcePlusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.secondIcePlusButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.secondIcePlusButton.sizeToFit()
        self.secondIcePlusButton.center = CGPoint(x: secondContainer.frame.width * (kEighth * 5), y: secondContainer.frame.height * (kSixth * 5))
        self.secondIcePlusButton.addTarget(self, action: "secondIcePlusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.secondIcePlusButton)
        
        self.secondNumIceLabel = UILabel()
        self.secondNumIceLabel.text = "\(numBoughtIce)"
        self.secondNumIceLabel.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.secondNumIceLabel.sizeToFit()
        self.secondNumIceLabel.center = CGPoint(x: secondContainer.frame.width * (kEighth * 6), y: secondContainer.frame.height * (kSixth * 5))
        containerView.addSubview(secondNumIceLabel)
        
        self.secondIceMinusButton = UIButton()
        self.secondIceMinusButton.setTitle("-", forState: UIControlState.Normal)
        self.secondIceMinusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.secondIceMinusButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.secondIceMinusButton.sizeToFit()
        self.secondIceMinusButton.center = CGPoint(x: secondContainer.frame.width * (kEighth * 7), y: secondContainer.frame.height * (kSixth * 5))
        self.secondIceMinusButton.addTarget(self, action: "secondIceMinusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.secondIceMinusButton)
    }
    
    func setupThirdContainer(containerView: UIView) {
        self.thirdStepTwoLabel = UILabel()
        self.thirdStepTwoLabel.text = "Step 2: Mix Your Lemonade"
        self.thirdStepTwoLabel.textColor = UIColor.blueColor()
        self.thirdStepTwoLabel.font = UIFont(name: "AmericanTypewriter", size: 20)
        self.thirdStepTwoLabel.sizeToFit()
        self.thirdStepTwoLabel.center = CGPoint(x: thirdContainer.frame.width * kHalf, y: thirdContainer.frame.height * kSixth)
        containerView.addSubview(thirdStepTwoLabel)
        
        self.thirdQueryLabel = UILabel()
        self.thirdQueryLabel.text = "Do your customers prefer more ice or more lemons today?"
        self.thirdQueryLabel.font = UIFont(name: "AmericanTypewriter", size: 10)
        self.thirdQueryLabel.sizeToFit()
        self.thirdQueryLabel.center = CGPoint(x: thirdContainer.frame.width * kHalf, y: thirdContainer.frame.height * (kSixth * 2))
        containerView.addSubview(thirdQueryLabel)
        
        self.thirdLemonsLabel = UILabel()
        self.thirdLemonsLabel.text = "Lemons:"
        self.thirdLemonsLabel.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.thirdLemonsLabel.sizeToFit()
        self.thirdLemonsLabel.center = CGPoint(x: thirdContainer.frame.width * kFourth, y: thirdContainer.frame.height * (kSixth * 3))
        containerView.addSubview(thirdLemonsLabel)
        
        self.thirdLemonsPlusButton = UIButton()
        self.thirdLemonsPlusButton.setTitle("+", forState: UIControlState.Normal)
        self.thirdLemonsPlusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.thirdLemonsPlusButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.thirdLemonsPlusButton.sizeToFit()
        self.thirdLemonsPlusButton.center = CGPoint(x: thirdContainer.frame.width * (kEighth * 5), y: thirdContainer.frame.height * (kSixth * 3))
        self.thirdLemonsPlusButton.addTarget(self, action: "thirdLemonsPlusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(thirdLemonsPlusButton)
        
        self.thirdNumLemonsLabel = UILabel()
        self.thirdNumLemonsLabel.text = "\(numUsedLemons)"
        self.thirdNumLemonsLabel.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.thirdNumLemonsLabel.sizeToFit()
        self.thirdNumLemonsLabel.center = CGPoint(x: thirdContainer.frame.width * (kEighth * 6), y: thirdContainer.frame.height * (kSixth * 3))
        containerView.addSubview(thirdNumLemonsLabel)
        
        self.thirdLemonsMinusButton = UIButton()
        self.thirdLemonsMinusButton.setTitle("-", forState: UIControlState.Normal)
        self.thirdLemonsMinusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.thirdLemonsMinusButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.thirdLemonsMinusButton.sizeToFit()
        self.thirdLemonsMinusButton.center = CGPoint(x: thirdContainer.frame.width * (kEighth * 7), y: thirdContainer.frame.height * (kSixth * 3))
        self.thirdLemonsMinusButton.addTarget(self, action: "thirdLemonsMinusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(thirdLemonsMinusButton)
        
        self.thirdIceLabel = UILabel()
        self.thirdIceLabel.text = "Ice:"
        self.thirdIceLabel.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.thirdIceLabel.sizeToFit()
        self.thirdIceLabel.center = CGPoint(x: thirdContainer.frame.width * kFourth, y: thirdContainer.frame.height * (kSixth * 5))
        containerView.addSubview(thirdIceLabel)
        
        self.thirdIcePlusButton = UIButton()
        self.thirdIcePlusButton.setTitle("+", forState: UIControlState.Normal)
        self.thirdIcePlusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.thirdIcePlusButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.thirdIcePlusButton.sizeToFit()
        self.thirdIcePlusButton.center = CGPoint(x: thirdContainer.frame.width * (kEighth * 5), y: thirdContainer.frame.height * (kSixth * 5))
        self.thirdIcePlusButton.addTarget(self, action: "thirdIcePlusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(thirdIcePlusButton)
        
        self.thirdNumIceLabel = UILabel()
        self.thirdNumIceLabel.text = "\(numUsedIce)"
        self.thirdNumIceLabel.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.thirdNumIceLabel.sizeToFit()
        self.thirdNumIceLabel.center = CGPoint(x: thirdContainer.frame.width * (kEighth * 6), y: thirdContainer.frame.height * (kSixth * 5))
        containerView.addSubview(thirdNumIceLabel)
        
        self.thirdIceMinusButton = UIButton()
        self.thirdIceMinusButton.setTitle("-", forState: UIControlState.Normal)
        self.thirdIceMinusButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.thirdIceMinusButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 18)
        self.thirdIceMinusButton.sizeToFit()
        self.thirdIceMinusButton.center = CGPoint(x: thirdContainer.frame.width * (kEighth * 7), y: thirdContainer.frame.height * (kSixth * 5))
        self.thirdIceMinusButton.addTarget(self, action: "thirdIceMinusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(thirdIceMinusButton)
    }
    
    func setupFourthContainer(containerView: UIView) {
        self.fourthStepThreeLabel = UILabel()
        self.fourthStepThreeLabel.text = "Step 3: Start selling your brew"
        self.fourthStepThreeLabel.textColor = UIColor.blueColor()
        self.fourthStepThreeLabel.font = UIFont(name: "AmericanTypewriter", size: 20)
        self.fourthStepThreeLabel.sizeToFit()
        self.fourthStepThreeLabel.center = CGPoint(x: fourthContainer.frame.width * kHalf, y: fourthContainer.frame.height * kSixth)
        containerView.addSubview(fourthStepThreeLabel)
        
        self.fourthQueryLabel = UILabel()
        self.fourthQueryLabel.text = "At the end of the day, you will either make or lose money. If you don't have enough money to buy new inventory, then you lose the game."
        self.fourthQueryLabel.font = UIFont(name: "AmericanTypewriter", size: 4)
        self.fourthQueryLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.fourthQueryLabel.numberOfLines = 0
        self.fourthQueryLabel.sizeToFit()
        self.fourthQueryLabel.center = CGPoint(x: fourthContainer.frame.width * kHalf, y: fourthContainer.frame.height * (kSixth * 3))
        containerView.addSubview(fourthQueryLabel)
        
        self.fourthStartButton = UIButton()
        self.fourthStartButton.setTitle("Start Day", forState: UIControlState.Normal)
        self.fourthStartButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.fourthStartButton.backgroundColor = UIColor.yellowColor()
        self.fourthStartButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 25)
        self.fourthStartButton.sizeToFit()
        self.fourthStartButton.center = CGPoint(x: fourthContainer.frame.width * kHalf, y: fourthContainer.frame.height * (kSixth * 5))
        self.fourthStartButton.addTarget(self, action: "fourthStartButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(fourthStartButton)
    }
    
    func secondLemonsPlusButtonPressed (button: UIButton) {
        if numMoney >= 2 {
            numMoney -= 2
            numBoughtLemons++
        }
        
        else {
            showAlertWithText(message: "You don't have enough money!")
        }
        
        updateView()
    }
    
    func secondLemonsMinusButtonPressed (button: UIButton) {
        if numBoughtLemons > 0 {
            numBoughtLemons--
            numMoney += 2
        }
        
        else {
            showAlertWithText(message: "You don't have enough lemons!")
        }
        updateView()
    }
    
    func secondIcePlusButtonPressed (button: UIButton) {
        if numMoney >= 1 {
            numMoney -= 1
            numBoughtIce++
        }
            
        else {
            showAlertWithText(message: "You don't have enough money!")
        }
        
        updateView()
    }
    
    func secondIceMinusButtonPressed (button: UIButton) {
        if numBoughtIce > 0 {
            numBoughtIce--
            numMoney += 1
        }
            
        else {
            showAlertWithText(message: "You don't have enough Ice!")
        }
        updateView()
    }
    
    func thirdLemonsPlusButtonPressed (button: UIButton) {
        if numLemon > 0 {
            numLemon--
            numUsedLemons++
        }
        
        else if numBoughtLemons > 0 {
            numBoughtLemons--
            numUsedLemons++
        }
        
        else {
            showAlertWithText(message: "You don't have enough lemons to use!")
        }
        updateView()
    }
    
    func thirdLemonsMinusButtonPressed (button: UIButton) {
        if numUsedLemons > 0 {
            numUsedLemons--
            numLemon++
        }
        
        else {
            showAlertWithText(message: "You aren't using any lemons!")
        }
        updateView()
    }
    
    func thirdIcePlusButtonPressed (button: UIButton) {
        if numIce > 0 {
            numIce--
            numUsedIce++
        }
        
        else if numBoughtIce > 0 {
            numBoughtIce--
            numUsedIce++
        }
        
        else {
            showAlertWithText(message: "You don't have enough ice to use!")
        }
        updateView()
    }
    
    func thirdIceMinusButtonPressed (button: UIButton) {
        if numUsedIce > 0 {
            numUsedIce--
            numIce++
        }
        
        else {
            showAlertWithText(message: "You aren't using any ice!")
        }
        updateView()
    }
    
    func fourthStartButtonPressed (button: UIButton) {
        if self.runCheck() {
            personArray = Factory.createArray()
            ratioLemonade = Double(numUsedLemons/numUsedIce)
            var count = 0
            
            for numPerson in personArray {
                if numPerson.taste == 3 && ratioLemonade > 1 {
                    numMoney++
                    count++
                } //strong lemonade
                
                if numPerson.taste == 2 && ratioLemonade == 1 {
                    numMoney++
                    count++
                } //balanced lemonade
                
                if numPerson.taste == 1 && ratioLemonade < 1 {
                    numMoney++
                    count++
                } //watery lemonade
            }
            showAlertWithText(message: "\(count) people purchased lemonade! You made $\(count)!")
            numLemon += numBoughtLemons
            numIce += numBoughtIce
            numBoughtLemons = 0
            numBoughtIce = 0
            numUsedLemons = 0
            numUsedIce = 0
            updateView()
        }
    }
    
    func updateView() {
        firstMoneyLabel.text = "\(numMoney)"
        firstLemonsLabel.text = "\(numLemon) Lemons"
        firstIceLabel.text = "\(numIce) Ice Cubes"
        
        secondNumLemonsLabel.text = "\(numBoughtLemons)"
        secondNumIceLabel.text = "\(numBoughtIce)"
        
        thirdNumLemonsLabel.text = "\(numUsedLemons)"
        thirdNumIceLabel.text = "\(numUsedIce)"
    }
    
    func showAlertWithText (header : String = "Warning", message : String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func resetAll() {
        numMoney = 10
        numLemon = 1
        numIce = 1
        numBoughtLemons = 0
        numBoughtIce = 0
        numUsedLemons = 0
        numUsedIce = 0
        
        updateView()
    }
    
    func runCheck() -> Bool {
        
        var canRun = false
        
        if numUsedLemons == 0 && numUsedIce == 0 {
            if numMoney < 3 && numIce == 0 && numLemon == 0 {
                showAlertWithText(message: "Bankrupt! Resetting...")
                resetAll()
            }
                
            else {
                showAlertWithText(message: "You need at least one lemon and one ice cube")
            }
        }
            
        else if numUsedLemons == 0 {
            if numMoney < 2 && numLemon == 0 && numBoughtLemons == 0 {
                showAlertWithText(message: "Bankrupt! Resetting...")
                resetAll()
            }
                
            else {
                showAlertWithText(message: "You need at least one lemon")
            }
        }
            
        else if numUsedIce == 0 {
            if numMoney < 1 && numIce == 0 && numBoughtIce == 0 {
                showAlertWithText(message: "Bankrupt! Resetting...")
                resetAll()
            }
                
            else {
                showAlertWithText(message: "You need at least one ice cube")
            }
        }
        
        else {
            canRun = true
        }
        return canRun
    }
}

