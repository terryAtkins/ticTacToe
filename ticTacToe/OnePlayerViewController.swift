//
//  OnePlayerViewController.swift
//  ticTacToe
//
//  Created by terry atkins on 24/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class OnePlayerViewController: UIViewController {
    
    let board = GameController()
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
    @IBOutlet weak var winnersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func squareHasBeenClicked(sender :UIButton) {
        if !board.checkForThreeInARow() {
            board.humanVsMachine(squareId: sender.tag)
            updateGameBoardSquares(squareId: sender.tag, senderId: sender)
            displayTheComputersChoice()
            if board.checkForThreeInARow() {
                var winner = board.playerId == 1 ? "Player Two Wins" : " Player One Wins"
                winnersLabel.hidden = false
                winnersLabel.text = winner
                resetButton.hidden = false
            } else if board.squaresLeftInGame() == 0 {
                winnersLabel.text = "It's a Draw"
                winnersLabel.hidden = false
                resetButton.hidden = false
            }
        }
    }
    func newGame() {
        board.playerId = 1
    }
    
    func updateGameBoardSquares(squareId square_tag :Int, senderId sender :UIButton) {
        var imageTodisplay = board.playerId == 2 ? playerX : playerO
        sender.setImage(UIImage(named: imageTodisplay), forState: UIControlState.Normal)
    }
    
    @IBAction func resetButtonClicked(sender: AnyObject) {
        winnersLabel.hidden = true
        resetButtonImages()
        resetButton.hidden = true
        board.resetBoard()
    }
    
    func resetButtonImages() {
        var buttonImages = [square0, square1, square2, square3, square4, square5, square6, square7, square8]
        for image in buttonImages {
            image.setImage(UIImage(), forState: UIControlState.Normal)
        }
    }
    
    func displayTheComputersChoice() {
        var imageTodisplay = board.cpu == 1 ? playerO : playerX
        var buttons = [square0, square1, square2, square3, square4, square5, square6, square7, square8]
        for choice in board.squaresSelectedDuringPlay {
            if board.gameSquares[choice] == 1 {
            buttons[choice].setImage(UIImage(named: imageTodisplay), forState: UIControlState.Normal)
            }
        }
    }


}
