//
//  ViewController.swift
//  ticTacToe
//
//  Created by terry atkins on 09/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class TwoPlayerViewController: UIViewController {
    
    let board = GameController()
    var player1 = 1
    var player2 = 2
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
    @IBOutlet weak var playerXToGoFirst: UIButton!
    @IBOutlet weak var playerOToGoFirst: UIButton!
    
    @IBOutlet weak var winnersLabel: UILabel!
    @IBOutlet weak var playingFirstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func squareHasBeenClicked(button :UIButton) {
        hideLabelsAndButtons()
        if !board.checkForThreeInARow() && board.humanVsHuman(squareId: button.tag) {
            updateImageForSquareSelectedByHuman(squareId: button.tag, senderId: button)
            
            if board.checkForThreeInARow() {
                winnersLabel.text = board.playerId == 1 ? "Player O Wins" : " Player X Wins"
                showLabelsAndButtons()
            } else if board.squaresLeftInGame() == 0 {
                winnersLabel.text = "It's a Draw"
                showLabelsAndButtons()
            }
        }
    }
    
    func updateImageForSquareSelectedByHuman(squareId square_tag :Int, senderId sender :UIButton) {
        var imageTodisplay = board.playerId == 2 ? playerX : playerO
            sender.setImage(UIImage(named: imageTodisplay), forState: UIControlState.Normal)
    }
    
    @IBAction func resetButtonClicked(sender: AnyObject) {
        winnersLabel.hidden = true
        resetButtonImages()
        resetButton.hidden = true
        board.resetBoard()
        playingFirstLabel.hidden = false
        playerXToGoFirst.hidden = false
        playerOToGoFirst.hidden = false
    }

    func resetButtonImages() {
    var buttonImages = [square0, square1, square2,square3, square4, square5, square6, square7, square8]
        for image in buttonImages {
            image.setImage(UIImage(), forState: UIControlState.Normal)
        }
    }
    
    func hideLabelsAndButtons() {
        playingFirstLabel.hidden = true
        playerXToGoFirst.hidden = true
        playerOToGoFirst.hidden = true
        winnersLabel.hidden = true
    }
    
    func showLabelsAndButtons() {
        winnersLabel.hidden = false
        resetButton.hidden = false
    }
    
    @IBAction func playerXSelectedToPlayFirst(sender: AnyObject) {
        hideLabelsAndButtons()
        board.playerId = 1
    }
    
    @IBAction func playerOSelectedToPlayFirst(sender: AnyObject) {
        hideLabelsAndButtons()
        board.playerId = 2
    }
    
}

































