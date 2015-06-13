//
//  AIController.swift
//  ticTacToe
//
//  Created by terry atkins on 13/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

public class AIController :NSObject {
    
    let gameBoard :GameBoard
    let players :Players
    
     public override init() {
        gameBoard = GameBoard()
        players = Players()
    }
    
    public func cpuToPlay(playerId player : Int) -> Bool {
        let numberOfTurns = players.turnsLeftToPlay
//        let player = player
        var result = false
        if numberOfTurns >= 9 {
            gameBoard.updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 0)
            result = true
        }
        return result
    }
    
    public func miniMax() -> Bool {
        return true
    }
}
