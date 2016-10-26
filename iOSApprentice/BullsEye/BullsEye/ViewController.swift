//
//  ViewController.swift
//  BullsEye
//
//  Created by Christian Perrone on 21/10/16.
//  Copyright © 2016 Christian Perrone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var initialValue: UISlider!
    @IBOutlet weak var randomTargetValue: UILabel!
    @IBOutlet weak var roundValue: UILabel!
    @IBOutlet weak var scoreValue: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var rounds = 0
    var score = 0
    
    @IBAction func showAlert() {
        
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        print("Points:\(points)")
        
        let message = "The value of the slider is now \(currentValue). \nThe target value is \(targetValue)."
        
        let alert = UIAlertController(title: "Hello world!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        score = score + points
        print("Score: \(score)")
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        
    }

    func startNewRound() {
        rounds += 1
        targetValue = Int(arc4random_uniform(100)) + 1
        currentValue = Int((initialValue.minimumValue + initialValue.maximumValue)/2)
        
        roundValue.text = "\(rounds)"
        randomTargetValue.text = "\(targetValue)"
        scoreValue.text = "\(score)"
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
        scoreValue.text = "\(score)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = Int(slider.value)
        print("The value of the slider is now \(currentValue)")
    }

}

