//
//  ViewController.swift
//  TheInfamousDiceGame
//
//  Created by Dan on 05/05/2019.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Variables
    var dice = [#imageLiteral(resourceName: "Kismet-Ace"), #imageLiteral(resourceName: "Kismet-Deuce"), #imageLiteral(resourceName: "Kismet-Trey"), #imageLiteral(resourceName: "Kismet-Four"), #imageLiteral(resourceName: "Kismet-Five"), #imageLiteral(resourceName: "Kismet-Six")]
    var randomDiceIndex = 0
    var score = 0
    var attempts = 0
    var success = 0
    
    // MARK: Outlets
    
    @IBOutlet weak var successRate: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var diceImage: UIImageView!
    @IBOutlet weak var rollButtonOutlet: UIButton!
    @IBOutlet weak var attempsLabel: UILabel!
    
    // MARK: Actions
    
    @IBAction func rollButtonAction(_ sender: Any) {
        randomDiceIndex = Int.random(in: 0 ... 5)
//        print(randomDiceIndex)
        diceImage.image = dice[randomDiceIndex]
        score += randomDiceIndex + 1
        print(score)
        
        scoreLabel.text = "\(score)"
        diceLogic()
    }
    func diceLogic() {
        if (randomDiceIndex == 0)
        {
            messageLabel.text = "Game over!"
            score = 0
            attempsFunction()
        }
        else if (score >= 21)
        {
            messageLabel.text = "You won!"
            score = 0
            
            attempsFunction()
            successRateFunction()
        }
    }
    
    func attempsFunction(){
        attempts += 1
        attempsLabel.text = "You've tried \(attempts) times."
    }
    
    func successRateFunction(){
        success += 1
        success = attempts / success
        successRate.text = "Your success rate it \(success)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

