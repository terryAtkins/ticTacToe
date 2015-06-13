//
//  AIController.swift
//  ticTacToe
//
//  Created by terry atkins on 13/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

public class AIController :GameBoard {
    
    let players :Players
    let randomNumber: Int
    var howManyTurnsHaveYouHad :Int
    
    public  override init() {
        
        players = Players()
        randomNumber = Int(arc4random_uniform(UInt32(5)))
        howManyTurnsHaveYouHad = 0
    }
    
    public func computersTurnToPlay(playerId player :Int) -> Bool {
        
        let player = player
        var computerTakenHisTurn = false
        
        if howManyTurnsHaveYouHad == 0 {
            selectACornerOrMiddleSquare(playerId: player)
            computerTakenHisTurn = true
            howManyTurnsHaveYouHad += 1
        } else {
            if miniMax() {
                howManyTurnsHaveYouHad += 1
                return true
            }
            
        }
        return computerTakenHisTurn
    }
    
    public func selectACornerOrMiddleSquare(playerId player:Int) {
        
        var randomNumber = Int(arc4random_uniform(UInt32(5)))
        switch randomNumber {
        case 1:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 0)
        case 2:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 2)
        case 3:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 0)
        case 4:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 2)
        default:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 0)
        }
    }
    
    public func miniMax() -> Bool {
        var max = 0
        var min = 0
        return true
    }
    
}