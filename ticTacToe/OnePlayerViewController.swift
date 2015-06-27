//
//  OnePlayerViewController.swift
//  ticTacToe
//
//  Created by terry atkins on 24/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class OnePlayerViewController: BoardLayoutViewController {
    
    @IBOutlet weak var humanFirstButton: UIButton!
    @IBOutlet weak var phoneFirstButton: UIButton!
    
    @IBOutlet weak var playingFirstLabel: UILabel!
    
    var humanFirst = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preventHumanTabbingTheSquares()
    }
    
    @IBAction func humanSelectedToPlayFirst(sender: AnyObject) {
        hideLabelsAndButtons()
        humanFirst = true
        game.playerId = 1
        game.cpu = 2
        allowHumanTabbingTheSquares()
    }
    
    @IBAction func phoneSelectedToPlayFirst(sender: AnyObject) {
        hideLabelsAndButtons()
        game.playerId = 2
        game.cpu = 1
        game.computersTurnToPlay(playerId: 1)
        displayTheComputersChoice()
        allowHumanTabbingTheSquares()
    }
    
    @IBAction func squareHasBeenClickedByHuman(sender :UIButton) {
        
        if !game.checkForThreeInARow() {
            game.humanVsMachine(squareId: sender.tag)
            updateImageForSquareSelectedByHuman(squareId: sender)
            displaySquareSelectedByComputer = NSTimer.scheduledTimerWithTimeInterval(0.5, target:self, selector: Selector("displayTheComputersChoice"), userInfo: nil, repeats: true)
        }
        
        if game.checkForThreeInARow() {
            winnersLabel.text = game.squaresSelectedDuringPlay.count % 2 != 0 && humanFirst ? "Human Wins" : "Phone Wins"
            showLabelsAndButtons()
        } else if game.squaresLeftInGame() == 0 {
            winnersLabel.text = "It's a Draw"
            showLabelsAndButtons()
        }
    }
    
    override func resetButtonClicked(sender: AnyObject) {
        super.resetButtonClicked(sender)
        humanFirstButton.hidden = false
        phoneFirstButton.hidden = false
        playingFirstLabel.hidden = false
        humanFirst = false
        preventHumanTabbingTheSquares()
    }
    
    override func hideLabelsAndButtons() {
        super.hideLabelsAndButtons()
        humanFirstButton.hidden = true
        phoneFirstButton.hidden = true
        playingFirstLabel.hidden = true
    }
    
}
