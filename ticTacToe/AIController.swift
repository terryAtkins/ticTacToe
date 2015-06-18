
//
//  AIController.swift
//  ticTacToe
//
//  Created by terry atkins on 13/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

public class AIController :GameBoard {
    
//    public var twoInARow :TwoInARow
    public var threeInARow :ThreeInARow
    var numberOfTurns :Int
    
    public override init() {
//        twoInARow = TwoInARow()
        threeInARow = ThreeInARow()
        numberOfTurns = 0
    }
    
    public func computersTurnToPlay(playerId player :Int) -> Bool {
        if isFirstPlayer_forTheFirstTwoPlaysSelectACorner(playerId: player) || isSecondPlayer_playForTheCenterOrCorner(playerId: player) {
            return true
        } else if isSecondPlayerAndSecondGo_chooseAnySquareExceptACorner(playerId: player) {
            return true
        } else if isClosingStagesOfTheGame_playForWinDrawOrBlock(playerId: player) {
            return true
        }
        return false
        
    }
    
    func isFirstPlayer_forTheFirstTwoPlaysSelectACorner(playerId player :Int) -> Bool  {
        if squaresLeftInGame() == 9 || squaresLeftInGame() == 7  {
            isCornersFree_playOne(playerId: player)
            return true
        }
        return false
    }
    
    func isSecondPlayer_playForTheCenterOrCorner(playerId player :Int) -> Bool {
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
        var result = false
        if squaresLeftInGame() > 0 {
            
            if isSquareStillInPlay(rowId: 0, columnId: 0) {
                updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 0)
                result = true
                
            } else if isSquareStillInPlay(rowId: 0, columnId: 2) {
                updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 2)
                result = true
            
            } else if isSquareStillInPlay(rowId: 2, columnId: 0) {
                updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 0)
                result = true
                
            } else if isSquareStillInPlay(rowId: 2, columnId: 2) {
                updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 2)
                result = true
            
            } else {
                result = false
            }
        }
        return result
    }
    
    public func isMiddleSquareFree_playIt(playerId player :Int) -> Bool {
        if isSquareStillInPlay(rowId: 1, columnId: 1) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 1, columnId: 1)
            return true
        }
        return false
    }
    
    public func isSecondPlayerAndSecondGo_chooseAnySquareExceptACorner(playerId player: Int) -> Bool {
        
        if isSquareStillInPlay(rowId: 0, columnId: 1) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 1)
            return true
            
        } else if isSquareStillInPlay(rowId: 1, columnId: 0) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 1, columnId: 0)
            return true
            
        } else if isSquareStillInPlay(rowId: 1, columnId: 2) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 1, columnId: 2)
            return true
            
        } else if isSquareStillInPlay(rowId: 2, columnId: 1) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 1)
            return true
            
        } else {
            return false
        }
    }
    
    func isClosingStagesOfTheGame_playForWinDrawOrBlock(playerId player :Int) -> Bool {
        if squaresLeftInGame() > 0 {
            if isWinDrawOrBlock(playerId: player) {
                // do I need this if statment?
                return true
            }
        }
        return false
    }
    
    public func isWinDrawOrBlock(playerId player :Int) -> Bool {
        
        var i = 0
        var j = 0
        var row :Int
        var column :Int
        var otherPlayer = switchPlayersId(playerId: player)
        var squaresToPlay = searchForEmptySquares()
        
        for item in squaresToPlay {
            row = squaresToPlay[i][0]
            column = squaresToPlay[i][1]
            
            if isABlock(playerId: otherPlayer, rowId: row, columnId: column) && threeInARow.checkForThreeInARow_ToWin() {
                
                return true
                
            } else if isWinningMove(playerId: player, rowId: row, columnId: column) &&
                threeInARow.checkForThreeInARow_ToWin() {
                    return true
            } else if i == squaresToPlay.count - 1 {
                updateGameBoardWhenSquareSelected(playerId: player, rowId: row, columnId: column)
            }
            i += 1
        }
        
        return false
    }

    func isWinningMove(playerId player :Int, rowId row :Int, columnId column: Int) -> Bool {
        if updateGameBoardWhenSquareSelected(playerId: player, rowId: row, columnId: column) && threeInARow.checkForThreeInARow_ToWin() {
            return true
        } else {
            resetSquare(rowId: row, columnId: column)
            return false
        }
    }
    
    func isABlock(playerId player:Int, rowId row :Int, columnId column :Int) -> Bool {
        if updateGameBoardWhenSquareSelected(playerId: player, rowId: row, columnId: column) && threeInARow.checkForThreeInARow_ToWin() {
            return true
        } else {
            resetSquare(rowId: row, columnId: column)
            return false
        }
    }

    public func switchPlayersId(playerId player: Int) -> Int {
       
         return player == 1 ? 2 : 1
    }
    
    func resetNumberOfPlays() {
        numberOfTurns = 0
    }
}











