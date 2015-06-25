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
    
    
    @IBAction func squareHasBeenClicked(button :UIButton) {
        hideLabelsAndButtons()
        
        if !board.checkForThreeInARow() {
            board.humanVsMachine(squareId: button.tag)
            updateImageForSquareSelectedByHuman(squareId: button.tag, senderId: button)
  

            displaySquareSelectedByComputer = NSTimer.scheduledTimerWithTimeInterval(0.8, target:self, selector: Selector("displayTheComputersChoice"), userInfo: nil, repeats: true)
            
            if board.checkForThreeInARow() {
                winnersLabel.text = board.playerId == 1 ? "Human Wins" : "Computer Wins"
                showLabelsAndButtons()
            } else if board.squaresLeftInGame() == 0 {
                winnersLabel.text = "It's a Draw"
                showLabelsAndButtons()
            }
        }
    }
 
    func updateImageForSquareSelectedByHuman(squareId square_tag :Int, senderId sender :UIButton) {
        var imageTodisplay = board.playerId == 1 ? playerX : playerO
        sender.setImage(UIImage(named: imageTodisplay), forState: UIControlState.Normal)
    }
    
    @IBAction func resetButtonClicked(sender: AnyObject) {
        resetButtonImages()
        board.resetBoard()
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
    
    func displayTheComputersChoice() {
        var imageTodisplay = board.cpu == 2 ? playerO : playerX
        var buttons = [square0, square1, square2, square3, square4, square5, square6, square7, square8]
        for choice in board.squaresSelectedDuringPlay {
            if board.gameSquares[choice] == board.cpu {
            buttons[choice].setImage(UIImage(named: imageTodisplay), forState: UIControlState.Normal)
            }
        }
    }
    @IBAction func humanSelectedToPlayFirst(sender: AnyObject) {
        hideLabelsAndButtons()
        board.playerId = 1
        board.cpu = 2
    }
    
    @IBAction func phoneSelectedToPlayFirst(sender: AnyObject) {
        hideLabelsAndButtons()
        board.playerId = 2
        board.cpu = 1
        board.computersTurnToPlay(playerId: 1)
        displayTheComputersChoice()
    }

}











