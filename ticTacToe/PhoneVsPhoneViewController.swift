//
//  PhoneVsPhoneViewController.swift
//  ticTacToe
//
//  Created by terry atkins on 24/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class PhoneVsPhoneViewController: BoardLayoutViewController {

    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var watchTheNextMoveButton: UIButton!
    
    @IBAction func startGame(sender: AnyObject) {
        startGameButton.hidden = true
        watchTheNextMoveButton.hidden = false
        
        if game.squaresLeftInGame() != 0  && !game.checkForThreeInARow(){
            if game.squaresLeftInGame() % 2 != 0 {
                game.computersTurnToPlay(playerId: 1)
                displaySquareSelectedByComputer = NSTimer.scheduledTimerWithTimeInterval(0.6, target:self, selector: Selector("updateSquareImages"), userInfo: nil, repeats: true)
            } else {
                game.computersTurnToPlay(playerId: 2)
                displaySquareSelectedByComputer = NSTimer.scheduledTimerWithTimeInterval(0.6, target:self, selector: Selector("updateSquareImages"), userInfo: nil, repeats: true)
            }
            
            if game.squaresLeftInGame() == 0  && !game.checkForThreeInARow() {
                winnersLabel.text = "It's a draw"
                showLabelsAndButtons()
                
            } else if game.checkForThreeInARow() {
                winnersLabel.text = "Something went wrong"
                showLabelsAndButtons()
            }
        }
    }
    
    override func resetButtonClicked(sender: AnyObject) {
        super.resetButtonClicked(sender)
        startGameButton.hidden = false
        watchTheNextMoveButton.hidden = true
    }
    
    override func showLabelsAndButtons() {
        super.showLabelsAndButtons()
        resetButton.hidden = false
        watchTheNextMoveButton.hidden = true
    }
    
    func updateSquareImages() {
        var buttons = [square0, square1, square2, square3, square4, square5, square6, square7, square8]
        for choice in game.squaresSelectedDuringPlay {
            if game.gameSquares[choice] == 1 {
                buttons[choice].setImage(UIImage(named: playerX), forState: UIControlState.Normal)
            } else {
                buttons[choice].setImage(UIImage(named: playerO), forState: UIControlState.Normal)
            }
        }
    }
    
}
