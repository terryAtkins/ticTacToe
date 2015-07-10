//
//  BoardViewController.swift
//  ticTacToe
//
//  Created by terry atkins on 27/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    let game = GameController()
    var isOnePlayer = false
    var isTwoPlayer = false
    var isPhoneVsPhone = false
    var isCpuPlaying = false
    
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
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var watchTheNextMoveButton: UIButton!
    
    @IBOutlet weak var winnersLabel: UILabel!
    @IBOutlet weak var playingFirstLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLabelsAndButtonsForGameSelected()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func humanSelectedToPlayFirst(sender: AnyObject) {
        isCpuPlaying = true
        hideCommonLabelsAndButtons()
        hideOnePlayerLabelsAndButtons()
    }
    
    @IBAction func phoneSelectedToPlayFirst(sender: AnyObject) {
        isCpuPlaying = true
        hideCommonLabelsAndButtons()
        hideOnePlayerLabelsAndButtons()
        game.computersTurn(buttons: buttonImages())
    }
    
    @IBAction func squareHasBeenClicked(sender :UIButton) {
        
        if game.controller.board.squaresSelectedDuringPlay.count < game.controller.board.gameSquares.count {
            if game.humanHasTakenTurn(squareId: sender) {
                checkForWinOrDrawAndUpdateLabels()
                
                if isCpuPlaying && !game.controller.board.isWin(gameBoard: game.controller.board.gameSquares) && game.controller.board.squaresSelectedDuringPlay.count < game.controller.board.gameSquares.count  {
                    game.computersTurn(buttons: buttonImages())
                    checkForWinOrDrawAndUpdateLabels()
                }
            }
        } else {
            checkForWinOrDrawAndUpdateLabels()
        }
    }

    func checkForWinOrDrawAndUpdateLabels() {
        if game.controller.board.isWin(gameBoard: game.controller.board.gameSquares) {
            winnersLabel.text = game.controller.board.squaresSelectedDuringPlay.count % 2 == 1 ? "X Wins" : "O Wins"
            showCommonLabelsAndButtons()
            hideLabelsAndButtonsForGameSelected()
        } else if game.controller.board.squaresSelectedDuringPlay.count == 9 {
            winnersLabel.text = "It's a Draw"
            showCommonLabelsAndButtons()
            hideLabelsAndButtonsForGameSelected()
        }
    }

    @IBAction func startAndWatchComputersNextMove(sender: AnyObject) {
        startGameButton.hidden = true
        watchTheNextMoveButton.hidden = false
        isCpuPlaying = true
        if !game.controller.board.isWin(gameBoard: game.controller.board.gameSquares) {
            game.computersTurn(buttons: buttonImages())
            checkForWinOrDrawAndUpdateLabels()
        } else {
            checkForWinOrDrawAndUpdateLabels()
        }
    }

    @IBAction func resetButtonClicked(sender: AnyObject) {
        game.resetSquareImages(buttons: buttonImages())
        game.controller.board.resetBoard()
        isCpuPlaying = false
        hideCommonLabelsAndButtons()
        showLabelsAndButtonsForGameSelected()        
    }
    
    func hideCommonLabelsAndButtons() {
        winnersLabel.hidden = true
        resetButton.hidden = true
    }
    
    func showCommonLabelsAndButtons() {
        resetButton.hidden = false
        winnersLabel.hidden = false
    }
    
    func buttonImages() -> [UIButton] {
       var buttons = [square0!, square1!, square2!, square3!, square4!, square5!, square6!, square7!, square8!]
        return buttons
    }
    
    func showLabelsAndButtonsForGameSelected() {
        if isOnePlayer {
            showOnePlayerLabelAndButtons()
        } else if isPhoneVsPhone {
            startGameButton.hidden = false
        }
    }
    
    func hideLabelsAndButtonsForGameSelected() {
        if isOnePlayer {
            hideOnePlayerLabelsAndButtons()
        } else if isPhoneVsPhone {
            hidePhoneVsPhoneLabelsAndButtons()
        }
    }
    
    func hideOnePlayerLabelsAndButtons() {
        humanFirstButton.hidden = true
        phoneFirstButton.hidden = true
        playingFirstLabel.hidden = true
    }
    
    func showOnePlayerLabelAndButtons() {
        humanFirstButton.hidden = false
        phoneFirstButton.hidden = false
        playingFirstLabel.hidden = false
    }
    
    func hidePhoneVsPhoneLabelsAndButtons() {
        watchTheNextMoveButton.hidden = true
        startGameButton.hidden = true
    }
    
    func computerPlayAMove() {
        game.controller.miniMax()
    }
}
