//
//  BoardViewController.swift
//  ticTacToe
//
//  Created by terry atkins on 27/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class BoardLayoutViewController: UIViewController {
    
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
    
    @IBOutlet weak var winnersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func preventHumanTabbingTheSquares() {
        var buttons = [square0, square1, square2, square3, square4, square5, square6, square7, square8]
        //xcode won't let me make the buttons array a property,
        
        for button in buttons {
            button.enabled = false
        }
    }
    
    func allowHumanTabbingTheSquares() {
        var buttons = [square0, square1, square2, square3, square4, square5, square6, square7, square8]
        
        for button in buttons {
            button.enabled = true
        }
    }
    
    
    func updateImageForSquareSelectedByHuman(squareId sender :UIButton) {
        var imageTodisplay = game.playerId == 1 ? playerX : playerO
        sender.setImage(UIImage(named: imageTodisplay), forState: UIControlState.Normal)
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
        winnersLabel.hidden = true        
    }
    
    func hideLabelsAndButtons() {
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
