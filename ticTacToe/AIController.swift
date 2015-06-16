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
    var howManyTurnsHaveYouHad :Int
    
    public override init() {
        
        players = Players()
        howManyTurnsHaveYouHad = 0
    }
    
    public func computersTurnToPlay(playerId player :Int) -> Bool {
        
        let player = player
        var computerTakenHisTurn = false
        
        if howManyTurnsHaveYouHad == 0 && players.turnsLeftInGame() == 9 {
            selectACornerOrMiddleSquare(playerId: player)
            howManyTurnsHaveYouHad += 1
            computerTakenHisTurn = true
        
        } else if howManyTurnsHaveYouHad == 1 && players.turnsLeftInGame() == 7 {
            selectACornerOrMiddleSquare(playerId: player, num: 1)
            howManyTurnsHaveYouHad += 1
            computerTakenHisTurn = true
            
        } else if players.turnsLeftInGame() >= 1{
            if miniMax() {
                howManyTurnsHaveYouHad += 1
                return true
            }
            
        }
        return computerTakenHisTurn
    }
    
    enum WhichSquare :Int {
        case topLeft = 1
        case topRight = 2
        case bottomLeft = 3
        case bottomRight = 4
        case center = 5
    }
    
    var cornerOrMiddleSquare = [0, 1, 2, 3, 4, 5]
    
    func randomSquareGen() -> Int {
        var i = Int(arc4random_uniform(UInt32(5)))
        if i >= 0 && i <= 4 {
            return i
        } else {
        randomSquareGen()
        }
        return i
    }

    public func selectACornerOrMiddleSquare(playerId player :Int, num :Int = -1) -> Bool  {

        var number = Int(arc4random_uniform(UInt32(5)))
        var checkCase = num >= 0 ? num : number
        
        switch checkCase {
        case 0:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 0)
            howManyTurnsHaveYouHad += 1
            return true
        case 1:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 2)
            howManyTurnsHaveYouHad += 1
            return true
        case 2:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 0)
            howManyTurnsHaveYouHad += 1
            return true
        case 3:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 2)
            howManyTurnsHaveYouHad += 1
            return true
        case 4:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 1, columnId: 1)
            howManyTurnsHaveYouHad += 1
            return true
        default:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 1, columnId: 1)
            howManyTurnsHaveYouHad += 1
            return true
        }
    }
    
    public func playTheMiddleSquareOrFindACornerToPlay(playerId player :Int) {
        
        upDateNames()
        
        if isSquareStillInPlay(rowId: 1, columnId: 1) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 1, columnId: 1)
        } else if isSquareStillInPlay(rowId: 0, columnId: 0) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 0)
        } else if isSquareStillInPlay(rowId: 0, columnId: 2) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 2)
        } else if isSquareStillInPlay(rowId: 2, columnId: 0) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 0)
        } else if isSquareStillInPlay(rowId: 2, columnId: 2) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 2)
        }

    }
    
    public func miniMax() -> Bool {
        var max = 0
        var min = 0
        return true
    }
    
}