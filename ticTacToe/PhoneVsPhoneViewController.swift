//
//  PhoneVsPhoneViewController.swift
//  ticTacToe
//
//  Created by terry atkins on 24/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class PhoneVsPhoneViewController: UIViewController {

    let board = GameController()
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
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var watchTheNextMoveButton: UIButton!
    
    @IBOutlet weak var winnersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func resetButtonClicked(sender: AnyObject) {
        winnersLabel.hidden = true
        resetButtonImages()
        resetButton.hidden = true
        startGameButton.hidden = false
        watchTheNextMoveButton.hidden = true
        board.resetBoard()
    }
    
    func resetButtonImages() {
        var buttonImages = [square0, square1, square2,square3, square4, square5, square6, square7, square8]
        for image in buttonImages {
            image.setImage(UIImage(), forState: UIControlState.Normal)
        }
    }
    
    @IBAction func startGame(sender: AnyObject) {
        startGameButton.hidden = true
        watchTheNextMoveButton.hidden = false

        if board.squaresLeftInGame() != 0  && !board.checkForThreeInARow(){
            if board.squaresLeftInGame() % 2 != 0 {
                board.computersTurnToPlay(playerId: 1)
                displaySquareSelectedByComputer = NSTimer.scheduledTimerWithTimeInterval(0.6, target:self, selector: Selector("updateSquareImages"), userInfo: nil, repeats: true)
            } else {
                board.computersTurnToPlay(playerId: 2)
                displaySquareSelectedByComputer = NSTimer.scheduledTimerWithTimeInterval(0.6, target:self, selector: Selector("updateSquareImages"), userInfo: nil, repeats: true)
            }
            
        if board.squaresLeftInGame() == 0  && !board.checkForThreeInARow() {
                winnersLabel.hidden = false
                winnersLabel.text = "It's a draw"
                resetButton.hidden = false
                watchTheNextMoveButton.hidden = true
        } else if board.checkForThreeInARow() {
            winnersLabel.hidden = false
            winnersLabel.text = "Something went wrong"
            resetButton.hidden = false
            watchTheNextMoveButton.hidden = true
            }
        }
    }
    
    func updateSquareImages() {
        var buttons = [square0, square1, square2, square3, square4, square5, square6, square7, square8]
        for choice in board.squaresSelectedDuringPlay {
            if board.gameSquares[choice] == 1 {
                buttons[choice].setImage(UIImage(named: playerX), forState: UIControlState.Normal)
            } else {
                buttons[choice].setImage(UIImage(named: playerO), forState: UIControlState.Normal)
            }
        }
    }
    
}
