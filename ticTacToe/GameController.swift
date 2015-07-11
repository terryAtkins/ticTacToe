
//
//  GameController.swift
//  ticTacToe
//
//  Created by terry atkins on 13/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//
import UIKit
import Foundation

public class GameController  {
    
   public let controller = AIController() // public for testing
    var displaySquareSelectedByComputer = NSTimer()
    
    public init() {
    }
    
    func imageTodisplay() -> String {
        var image = "playerO"
        for square in controller.board.squaresSelectedDuringPlay {
            image = controller.board.gameSquares[square] == 1 ? "playerX" : "playerO"
        }
        return image
    }
    
    public func humanHasTakenTurn(squareId button :UIButton) -> Bool {
        if controller.board.isSquareStillInPlay(squareId: button.tag) {
            controller.board.updateGameBoardWithSelectedSquare(squareId: button.tag)
            button.setImage(UIImage(named: imageTodisplay()), forState: UIControlState.Normal)
            return true
        }
        return false
    }
    
    func resetSquareImages(#buttons :[UIButton]) {
        for image in buttons {
            image.setImage(UIImage(), forState: UIControlState.Normal)
        }
    }
    
    func updateSquareImages(#buttons :[UIButton]) {
        for choice in controller.board.squaresSelectedDuringPlay {
            var image = controller.board.squaresSelectedDuringPlay.count % 2 == 0  ? "playerX" : "playerO"
            buttons[choice].setImage(UIImage(named: image), forState: UIControlState.Normal)
        }
    }
        
    public func computersTurn(#buttons: [UIButton]) {
        var squareSelected = controller.miniMax()
        controller.board.updateGameBoardWithSelectedSquare(squareId: squareSelected)
        displayTheComputersChoice(square: squareSelected, buttons: buttons)
        
    }
    
    func displayTheComputersChoice(#square: Int, buttons: [UIButton]) {
        buttons[square].setImage(UIImage(named: imageTodisplay()), forState: UIControlState.Normal)
    }
}




