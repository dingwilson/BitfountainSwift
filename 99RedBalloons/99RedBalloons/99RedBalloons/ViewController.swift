//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Wilson Ding on 1/4/15.
//  Copyright (c) 2015 Wilson Ding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberOfBalloonsLabel: UILabel!
    @IBOutlet weak var balloonPhoto: UIImageView!
    
    var balloonArray: [Balloon] = []
    var numOfBalloons = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var numBalloons = "0 Balloons"
        var balloonImage = UIImage(named: "BerlinTVTower.jpg")
        
        numberOfBalloonsLabel.text = numBalloons
        balloonPhoto.image = balloonImage
        
        for var count = 1; count < 100; count++ {
            numBalloons = "\(count) Balloons"
            switch (arc4random_uniform(4)) {
            case 0: balloonImage = UIImage(named: "RedBalloon1.jpg")
            case 1: balloonImage = UIImage(named: "RedBalloon2.jpg")
            case 2: balloonImage = UIImage(named: "RedBalloon3.jpg")
            case 3: balloonImage = UIImage(named: "RedBalloon4.jpg")
            default: balloonImage = UIImage(named: "BerlinTVTower.jpg")
            }
            
            var newBalloon = Balloon()
            
            newBalloon.numberOfBalloons = numBalloons
            newBalloon.balloonImage = balloonImage
            
            balloonArray.append(newBalloon)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        numberOfBalloonsLabel.text = balloonArray[numOfBalloons].numberOfBalloons
        balloonPhoto.image = balloonArray[numOfBalloons].balloonImage
        if numOfBalloons < 98 {
            numOfBalloons++
        }
    }

}

