
//
//  AIController.swift
//  ticTacToe
//
//  Created by terry atkins on 13/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

public class AIController :ThreeInARow {
    
    var squaresToPlay = [[Int]]()
        
    public func computersTurnToPlay(playerId player :Int) -> Bool {
        if firstPlayer_forTheFirstTwoPlaysSelectACorner(playerId: player) || secondPlayer_playForTheCenterOrCorner(playerId: player) {
            return true
        } else if isClosingStagesOfTheGame_playForWinDrawOrBlock(playerId: player) {
            return true
        }
        return false
    }
    
    func firstPlayer_forTheFirstTwoPlaysSelectACorner(playerId player :Int) -> Bool  {
        if squaresLeftInGame() == 9 || squaresLeftInGame() == 7  {
            isCornersFree_playOne(playerId: player)
            return true
        }
        return false
    }
    
    func secondPlayer_playForTheCenterOrCorner(playerId player :Int) -> Bool {
        if  squaresLeftInGame() == 8  {
            if isMiddleSquareFree_playIt(playerId: player) {
                return true
            } else if isCornersFree_playOne(playerId: player) {
                return true
            }
        }
        return false
    }
    
    public func isCornersFree_playOne(playerId player :Int) -> Bool {
        let cornerSquares = [(row: 0, column: 0), (row: 0, column: 2), (row: 2, column: 0), (row: 2, column: 2)]
        
        for corner in cornerSquares {
            if isSquareStillInPlay(rowId: corner.row, columnId: corner.column) {
                updateGameBoardWhenSquareSelected(playerId: player, rowId: corner.row, columnId: corner.column)
                return true
            }
        }
        return false
    }
    
    public func isMiddleSquareFree_playIt(playerId player :Int) -> Bool {
        if isSquareStillInPlay(rowId: 1, columnId: 1) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 1, columnId: 1)
            return true
        }
        return false
    }
    
    public func chooseAnySquareExceptACorner(playerId player: Int) -> Bool {
        var notACornerOrTheMiddle = [(row: 0, column: 1),(row: 1, column: 0),(row: 1, column: 2),(row: 2, column: 1)]
        
        for square in notACornerOrTheMiddle {
            if isSquareStillInPlay(rowId: square.row, columnId: square.column) {
                updateGameBoardWhenSquareSelected(playerId: player, rowId: square.row, columnId: square.column)
                return true
            }
        }
        return false
    }
    
    func isClosingStagesOfTheGame_playForWinDrawOrBlock(playerId player :Int) -> Bool {
        if squaresLeftInGame() > 0 {
            if isWinDrawOrBlock(playerId: player) {
                return true
            }
        }
        return false
    }
    
    public func isWinDrawOrBlock(playerId player :Int) -> Bool {
        
        var index = 0
        var j = 0
        var row :Int
        var column :Int
        squaresToPlay = searchForEmptySquares()
        
        for item in squaresToPlay {
            row = squaresToPlay[index][0]
            column = squaresToPlay[index][1]
            
            if winningMove(playerId: player, rowId: row, columnId: column) {
                updateGameBoardWhenSquareSelected(playerId: player, rowId: row, columnId: column)
                return true
            } else if aBlockingMove(playerId: player, rowId: row, columnId: column) {
                updateGameBoardWhenSquareSelected(playerId: player, rowId: row, columnId: column)
                return true
            } else if squaresLeftInGame() == 6  {
                chooseAnySquareExceptACorner(playerId: player)
            } else if playAnySquare(loopIndex: index) {
                updateGameBoardWhenSquareSelected(playerId: player, rowId: row, columnId: column)
                return true
            }
            index += 1
        }
        return false
    }

    public func winningMove(playerId player :Int, rowId row :Int, columnId column: Int) -> Bool {
        updateGameBoardWhenSquareSelected(playerId: player, rowId: row, columnId: column)
        
        if checkForThreeInARow() {
            resetSquare(rowId: row, columnId: column)
            return true
        } else {
            resetSquare(rowId: row, columnId: column)
            return false
        }
    }
    
    public func aBlockingMove(playerId player:Int, rowId row :Int, columnId column :Int) -> Bool {
        updateGameBoardWhenSquareSelected(playerId: switchPlayersId(playerId: player), rowId: row, columnId: column)
        
        if checkForThreeInARow() {
            resetSquare(rowId: row, columnId: column)
            return true
        } else {
            resetSquare(rowId: row, columnId: column)
            return false
        }
    }
    
    func playAnySquare(loopIndex index :Int) -> Bool {
        if index == squaresToPlay.count - 1 {
            return true
        }
        return false
    }

    public func switchPlayersId(playerId player: Int) -> Int {
       return player == 1 ? 2 : 1
    }
}











