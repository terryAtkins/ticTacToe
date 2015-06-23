
//
//  AIController.swift
//  ticTacToe
//
//  Created by terry atkins on 13/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

public class AIController :ThreeInARow {
    
    var squaresToPlay = [Int]()
        
    public func computersTurnToPlay(playerId player :Int) -> Bool {
        if firstPlayer_forTheFirstTwoPlaysSelectACorner(playerId: player) || secondPlayer_playForTheCenterOrCorner(playerId: player) {
            return true
        } else if playForWinOrBlock(playerId: player) {
            return true
        } else if playAnyFreeSquare(playerId: player){
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
        if squaresLeftInGame() == 8  {
            if isMiddleSquareFree_playIt(playerId: player) {
                return true
            } else if isCornersFree_playOne(playerId: player) {
                return true
            }
        }
        return false
    }
    
    public func isCornersFree_playOne(playerId player :Int) -> Bool {
        let cornerSquares = [0, 2, 6, 8]
        
        for corner in cornerSquares {
            if isSquareStillInPlay(squareId: corner) {
                updateGameBoardWithSelectedSquare(playerId: player, squareId: corner)
                return true
            }
        }
        return false
    }
    
    public func isMiddleSquareFree_playIt(playerId player :Int) -> Bool {
        if isSquareStillInPlay(squareId: 4) {
            updateGameBoardWithSelectedSquare(playerId: player, squareId: 4)
            return true
        }
        return false
    }
    
    public func chooseAnySquareExceptACorner(playerId player: Int) -> Bool {
        var notACornerOrTheMiddle = [1, 3, 5, 7]
    
        for square in notACornerOrTheMiddle {
            if isSquareStillInPlay(squareId: square) {
                updateGameBoardWithSelectedSquare(playerId: player, squareId: square)
                return true
            }
        }
        return false
    }
    
    public func playAnyFreeSquare(playerId player :Int) -> Bool {
        squaresToPlay = searchForEmptySquares()
        for square in squaresToPlay {
            if isSquareStillInPlay(squareId: square) {
                updateGameBoardWithSelectedSquare(playerId: player, squareId: square)
                return true
            }
        }
        return false
    }
    
    public func playForWinOrBlock(playerId player :Int) -> Bool {
        
        squaresToPlay = searchForEmptySquares()
        
        for square in squaresToPlay {
            if winningMove(playerId: player, squareId: square) {
                updateGameBoardWithSelectedSquare(playerId: player, squareId: square)
                return true
            } else if aBlockingMove(playerId: player, squareId: square) {
                updateGameBoardWithSelectedSquare(playerId: player, squareId: square)
                return true
            }
        }
        return false
    }

    public func winningMove(playerId player :Int, squareId square :Int) -> Bool {
        updateGameBoardWithSelectedSquare(playerId: player, squareId: square)
        
        if checkForThreeInARow() {
            resetSquare(squareId: square)
            return true
        } else {
            resetSquare(squareId: square)
        }
        return false
    }
    
    public func aBlockingMove(playerId player:Int, squareId square :Int) -> Bool {
        var player2 = switchPlayersId(playerId: player)
        updateGameBoardWithSelectedSquare(playerId: player2, squareId: square)
        
        if checkForThreeInARow() {
            resetSquare(squareId: square)
            return true
        } else {
            resetSquare(squareId: square)
            return false
        }
    }
    
//    func playAnySquare(playerId player :Int, squareIndex index :Int) -> Bool {
//        if index != squaresToPlay.count - 1 {
//            
//            return true
//        }
//        return false
//    }

    public func switchPlayersId(playerId player: Int) -> Int {
       return player == 1 ? 2 : 1
    }
}











