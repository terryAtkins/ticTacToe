//
//  OnePlayerViewController.swift
//  ticTacToe
//
//  Created by terry atkins on 24/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class OnePlayerViewController: UIViewController {
    
    let game = GameController()
    var displaySquareSelectedByComputer = NSTimer()
    var playerX = "playerX"
    var playerO = "playerO"
    
    @IBOutlet weak var square0: UIButton!
    @IBOutlet weak var square1: UIButton!
    @IBOutlet weak var square2: UIButton!
    @IBOutlet weak var square3: UIButton!
    @IBOutlet weak var square4: UIButton!
    @IBOutlet weak var square5: UIButton!
    @IBOutlet weak var square6: UIButton!
    @IBOutlet weak var square7: UIButton!
    @IBOutlet weak var square8: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var humanFirstButton: UIButton!
    @IBOutlet weak var phoneFirstButton: UIButton!
    
    @IBOutlet weak var winnersLabel: UILabel!
    @IBOutlet weak var playingFirstLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func humanSelectedToPlayFirst(sender: AnyObject) {
        hideLabelsAndButtons()
        game.playerId = 1
        game.cpu = 2
    }
    
    @IBAction func phoneSelectedToPlayFirst(sender: AnyObject) {
        hideLabelsAndButtons()
        game.playerId = 2
        game.cpu = 1
        game.computersTurnToPlay(playerId: 1)
        displayTheComputersChoice()
    }
    
    @IBAction func squareHasBeenClicked(button :UIButton) {
        hideLabelsAndButtons()
        
        if !game.checkForThreeInARow() {
            game.humanVsMachine(squareId: button.tag)
            updateImageForSquareSelectedByHuman(squareId: button)
            displaySquareSelectedByComputer = NSTimer.scheduledTimerWithTimeInterval(0.6, target:self, selector: Selector("displayTheComputersChoice"), userInfo: nil, repeats: true)
            
            if game.checkForThreeInARow() {
                if game.squaresSelectedDuringPlay.count % 2 != 0 {
                    winnersLabel.text = "Player 1 Wins"
                } else {
                    winnersLabel.text = "Player 2 Wins"
                }
                showLabelsAndButtons()
            } else if game.squaresLeftInGame() == 0 {
                winnersLabel.text = "It's a Draw"
                showLabelsAndButtons()
            }
        }
    }
 
    func updateImageForSquareSelectedByHuman(squareId button :UIButton) {
        var imageTodisplay = game.playerId == 1 ? playerX : playerO
        button.setImage(UIImage(named: imageTodisplay), forState: UIControlState.Normal)
    }
    
    func displayTheComputersChoice() {
        var imageTodisplay = game.cpu == 2 ? playerO : playerX
        var buttons = [square0, square1, square2, square3, square4, square5, square6, square7, square8]
        for choice in game.squaresSelectedDuringPlay {
            if game.gameSquares[choice] == game.cpu {
                buttons[choice].setImage(UIImage(named: imageTodisplay), forState: UIControlState.Normal)
            }
        }
    }
    
    @IBAction func resetButtonClicked(sender: AnyObject) {
        resetButtonImages()
        game.resetBoard()
        resetButton.hidden = true
        playingFirstLabel.hidden = false
        humanFirstButton.hidden = false
        phoneFirstButton.hidden = false
        winnersLabel.hidden = true
    }
    
    func hideLabelsAndButtons() {
        playingFirstLabel.hidden = true
        humanFirstButton.hidden = true
        phoneFirstButton.hidden = true
        winnersLabel.hidden = true
    }
    
    func showLabelsAndButtons() {
        winnersLabel.hidden = false
        resetButton.hidden = false
    }
    
    func resetButtonImages() {
        var buttonImages = [square0, square1, square2, square3, square4, square5, square6, square7, square8]
        for image in buttonImages {
            image.setImage(UIImage(), forState: UIControlState.Normal)
        }
    }
    
}











