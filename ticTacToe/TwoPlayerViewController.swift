//
//  ViewController.swift
//  ticTacToe
//
//  Created by terry atkins on 09/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class TwoPlayerViewController: BoardLayoutViewController {
    
    @IBOutlet weak var playerOToGoFirst: UIButton!
    @IBOutlet weak var playerXToGoFirst: UIButton!
    
    @IBOutlet weak var playingFirstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preventHumanTabbingTheSquares()
    }
    
    @IBAction func playerXSelectedToPlayFirst(sender: AnyObject) {
        hideLabelsAndButtons()
        game.playerId = 1
        allowHumanTabbingTheSquares()
    }
    
    @IBAction func playerOSelectedToPlayFirst(sender: AnyObject) {
        hideLabelsAndButtons()
        game.playerId = 2
        allowHumanTabbingTheSquares()
    }
    
    @IBAction func squareHasBeenClicked_twoPlayer(sender :UIButton) {
        
        if !game.checkForThreeInARow() && game.humanVsHuman(squareId: sender.tag) {
            updateImageForSquareSelectedByHuman(squareId: sender)
            
            if game.checkForThreeInARow() {
                winnersLabel.text = game.playerId == 1 ? "Player X Wins" : " Player O Wins"
                showLabelsAndButtons()
            } else if game.squaresLeftInGame() == 0 {
                winnersLabel.text = "It's a Draw"
                showLabelsAndButtons()
            }
        }
    }
    
    override func resetButtonClicked(sender: AnyObject) {
        super.resetButtonClicked(sender)
        playerOToGoFirst.hidden = false
        playerXToGoFirst.hidden = false
        playingFirstLabel.hidden = false
            preventHumanTabbingTheSquares()
    }
    
    override func hideLabelsAndButtons() {
        super.hideLabelsAndButtons()
        playerOToGoFirst.hidden = true
        playerXToGoFirst.hidden = true
        playingFirstLabel.hidden = true
    }
    
}
