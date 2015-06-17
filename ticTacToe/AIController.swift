
//
//  AIController.swift
//  ticTacToe
//
//  Created by terry atkins on 13/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

public class AIController :GameBoard {
    
    public let players :Players // needs to be public for testing in XCTest
//    var howManyTurnsHaveYouHad :Int
    public var twoInARow :TwoInARow
    public var thereInARow :ThreeInARow
//    var squaresToPlay = [[Int]]() // or use Array<Array<Int>>()
    
    public override init() {
        
        players = Players()
//        howManyTurnsHaveYouHad = 0
        twoInARow = TwoInARow()
        thereInARow = ThreeInARow()
    }
    
    public func computersTurnToPlay(playerId player :Int) -> Bool {
        
        if isFirstPlayerAndFirstGo_selectACornerOrMiddleSqaure(playerId: player) ||
            isSecondPlayerAndFirstGo_playTheMiddleOrACorner(playerId: player) ||
            isClosingStagesOfTheGame_playMiniMax(playerId: player) {
                
                players.reduceNumberOfTurnsLeftToPlayByOne()
//                howManyTurnsHaveYouHad -= 1
                return true
        }
        return false
    }
    
    func isFirstPlayerAndFirstGo_selectACornerOrMiddleSqaure(playerId player :Int) -> Bool {
//        howManyTurnsHaveYouHad == 0 && players.turnsLeftInGame() == 9
        if players.turnsLeftInGame() == 9 {
            if selectACornerOrMiddleSquare(playerId: player) {
                return true
            }
        }
        return false
    }
    
    public func selectACornerOrMiddleSquare(playerId player :Int) -> Bool  {
        
        switch Int(arc4random_uniform(UInt32(5))) {
        case 0:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 0)
            return true
        case 1:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 2)
            return true
        case 2:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 0)
            return true
        case 3:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 2)
            return true
        case 4:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 1, columnId: 1)
            return true
        default:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 1, columnId: 1)
            return true
        }
    }
    
    func isSecondPlayerAndFirstGo_playTheMiddleOrACorner(playerId player :Int) -> Bool {
//        if howManyTurnsHaveYouHad == 1 && players.turnsLeftInGame() >= 7 
        if players.turnsLeftInGame() >= 7 {
            if playTheMiddleSquareOrFindACornerToPlay(playerId: player) {
                return true
            }
        }
        return false
    }
    
    public func playTheMiddleSquareOrFindACornerToPlay(playerId player :Int) -> Bool {
        
        upDateNames()
        
        if isSquareStillInPlay(rowId: 1, columnId: 1) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 1, columnId: 1)
            return true
        } else if isSquareStillInPlay(rowId: 0, columnId: 0) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 0)
            return true
        } else if isSquareStillInPlay(rowId: 0, columnId: 2) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 2)
            return true
        } else if isSquareStillInPlay(rowId: 2, columnId: 0) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 0)
            return true
        } else if isSquareStillInPlay(rowId: 2, columnId: 2) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 2)
            return true
        }
        return false
    }
    
    func isClosingStagesOfTheGame_playMiniMax(playerId player :Int) -> Bool {
        if players.turnsLeftInGame() > 0 {
            if miniMax(playerId: player) { // do I need this if statment?
                return true
            }
        }
        return false
    }
    
    public func miniMax(playerId player :Int) -> Bool {
        var player = player
        var i = 0
        var j = 0
        var row :Int
        var column :Int
        var max = 0
        var lose = 0
        var draw = 0
        var searchDepth = 2
        var board = gameSquares
        var otherPlayer = switchPlayersId(playerId: player)
        var squaresToPlay = searchForEmptySquares()
        
        
        

        

//            var tempBoard = gameSquares
//            var firstRowToPlay :Int
//            var secondRowToPlay :Int
//            var thridRowToPlay :Int
//            var firstColumnToPlay :Int
//            var secondColumnToPlay :Int
//            var thridColumnToPlay :Int
            
            
            for item in squaresToPlay {
                row = squaresToPlay[i][0]
                column = squaresToPlay[i][1]
                
                if isABlock(playerId: otherPlayer, rowId: row, columnId: column) && thereInARow.checkForThreeInARow_ToWin() {
                    updateGameBoardWhenSquareSelected(playerId: player, rowId: row, columnId: column)
                    return true
                    
                } else if isWinningMove(playerId: player, rowId: row, columnId: column) &&
                    thereInARow.checkForThreeInARow_ToWin() {
                        return true
                } else {
//                   resetSquare(rowId: row, columnId: column)
                }
                i += 1
                }

                return false
            }
            
    

    

    func isWinningMove(playerId player :Int, rowId row :Int, columnId column: Int) -> Bool {
        if updateGameBoardWhenSquareSelected(playerId: player, rowId: row, columnId: column) && thereInARow.checkForThreeInARow_ToWin() {
            return true
        } else {
            return false
        }
    }
    func isABlock(playerId player:Int, rowId row :Int, columnId column :Int) -> Bool {
        if updateGameBoardWhenSquareSelected(playerId: player, rowId: row, columnId: column) && thereInARow.checkForThreeInARow_ToWin() {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: row, columnId: column)
            
            return true
        }
        return false
    }


//    public func blockAWinIfPlayerHasTwoInARow() -> Bool {
//        if twoInARow.checkForTwoInARow() {
//            return true
//        }
//        return true
//    }
    
    public func searchForEmptySquares() -> [[Int]] { // or use Array<Array<Int>>
        var rowNumber = 0
        var columnNumber = 0
        var emptySquares = [[Int]]() // or use Array<Array<Int>>() [[0,0],[0,0]......]
        
        for row in gameSquares {
            for column in row {
                if isSquareStillInPlay(rowId: rowNumber, columnId: columnNumber) {
                    emptySquares.append([rowNumber, columnNumber])
                    columnNumber += 1
                   
                } else {
                    columnNumber += 1
                }
            }
            columnNumber = 0
            rowNumber += 1
        }
        
        return emptySquares
    }
    
    public func switchPlayersId(playerId player: Int) -> Int {
       
         return player == 1 ? 2 : 1
    }
}











