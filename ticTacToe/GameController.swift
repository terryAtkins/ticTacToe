
//
//  GameController.swift
//  ticTacToe
//
//  Created by terry atkins on 13/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

public class GameController :AIController {
    let board = GameBoard()
    var playerId :Int // needs to be public for testing
    var cpu :Int
    
    public override init() {
        playerId = 1
        cpu = 2
    }
        
    public func humanVsMachine(squareId square :Int) {

        if cpu == 1 && squaresSelectedDuringPlay.count % 2 == 0 {
            computersTurnToPlay(playerId: cpu)
            
        } else if humanHasTakenTurn(squareId: square)  {
            computersTurnToPlay(playerId: cpu)
        }
    }
    
    public func humanVsHuman(squareId square :Int) -> Bool {
        if humanHasTakenTurn(squareId: square) {
            playerId = switchPlayersId(playerId: playerId)
            return true
        }
        return false
    }
    
    public func humanHasTakenTurn(squareId square :Int) -> Bool {
        if isSquareStillInPlay(squareId: square) {
            updateGameBoardWithSelectedSquare(playerId: playerId, squareId: square)
            return true
        }
        return false
    }

}




