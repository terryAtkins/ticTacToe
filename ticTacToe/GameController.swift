//
//  GameController.swift
//  ticTacToe
//
//  Created by terry atkins on 13/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

public class GameController {
   
    public func startNewGame() {
        let newGame = GameBoard()
        let newPlayers = Players()
        let cpu = AIController()
        
        
        
        newPlayers.chooseGameMethod(1)
        newGame.isSquareStillInPlay(rowId: 0, columnId: 0)
        newGame.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 3)
//        newGame.checkForThreeInARowToWin()
//        newPlayers.reduceNumberOfTurnsLeftToPlayByOne()
        newPlayers.nextPlayersTurn(1)
        
        
        
        
    }
}