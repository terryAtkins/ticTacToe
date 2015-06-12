//
//  GameManager.swift
//  ticTacToe
//
//  Created by terry atkins on 12/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit


public class GameManager: NSObject {
   
    public func startNewGame() {
        let newGame = GameBoard()
        let newPlayers = Players()
        
        
        
        newPlayers.chooseGameMethod(1)
        newPlayers.chooseWhoGoesFirst(1)
        newGame.hasSquareBeenSelectedDuringPlay(1)
        newGame.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 3)
        newGame.checkForThreeInARowToWin()
        newPlayers.numberOfTurnsLeftToPlay()
        newPlayers.nextPlayersTurn(1)
        
        
        
        
    }
    
}
