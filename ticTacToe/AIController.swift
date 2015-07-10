
//
//  AIController.swift
//  ticTacToe
//
//  Created by terry atkins on 13/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

public class AIController {
    
    public let board = GameBoard() // public for testing
    let boardInPlay :[Int]
    
    public init() {
        boardInPlay = board.gameSquares
    }
    
    public func miniMax() -> Int {
        
        var emptySquares = board.searchForEmptySquares()
        var dummyBoard = board.gameSquares
        let currentPlayer = board.squaresSelectedDuringPlay.count % 2 == 0 ? 1 : 2
        let opponent = currentPlayer == 1 ? 2 : 1
        var result :[(squareId: Int, minMax: Int)] = []
        var remainingSquares :[Int]
        var forEachEmptySquares :[Int]
        var score = 0
        
        for square in emptySquares {
            
            if isNextMoveAWinForCurrentPlayer(squareId: square, currentPlayerId: currentPlayer, dummyBoard: dummyBoard) || dummyBoard.count == 9 {
                score += 10
                result += [(squareId:square, minMax: score)]
                break
            } else {
                dummyBoard[square] = currentPlayer
                emptySquares.removeAtIndex(0)
                remainingSquares = emptySquares
                
                for forEachEmptySquares in remainingSquares {
                    if isNextMoveAWinForOpponent(squareId: forEachEmptySquares, opponentId: opponent, dummyBoard: dummyBoard) {
                        score += -1
                    }
                    
                    if forEachEmptySquares < emptySquares.count - 2  {
                        if isNextMoveAWinForCurrentPlayer(squareId: forEachEmptySquares + 1, currentPlayerId: currentPlayer, dummyBoard: dummyBoard) {
                            score += 1
                        }
                    }
                    
                    if forEachEmptySquares == emptySquares.count - 1 && !board.isWin(gameBoard: dummyBoard) {
                        score += 0
                    }
                }
                result += [(squareId:square, minMax: score)]
                score = 0
            }
            dummyBoard = board.gameSquares
        }
        result.sort({a,b in a.1 > b.1})
        return result.first!.squareId
    }
    
    public func isNextMoveAWinForCurrentPlayer(var #squareId :Int, var currentPlayerId :Int, var dummyBoard: [Int]) -> Bool {
        dummyBoard[squareId] = currentPlayerId
        return board.isWin(gameBoard: dummyBoard)
    }
    
    public func isNextMoveAWinForOpponent(var #squareId :Int, var opponentId :Int, var dummyBoard: [Int]) -> Bool {
        dummyBoard[squareId] = opponentId
        return board.isWin(gameBoard: dummyBoard)
    }
}












