
//
//  AIController.swift
//  ticTacToe
//
//  Created by terry atkins on 13/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

public class AIController {
    
    public let board = GameBoard()
    
    public init(){
    }
    
    public func miniMax() -> Int {
        
        var playerId = board.squaresSelectedDuringPlay.count % 2 == 0 ? 1 : 2
        var currentBoard = board.gameSquares
        var dummyBoard = currentBoard
        var currentSquaresSelected = board.squaresSelectedDuringPlay
        var emptySquares = board.searchForEmptySquares()
        let opponent = playerId == 1 ? 2 : 1
        var result: [(squareId: Int, minMax: Int)] = []
        
        for square in emptySquares {
            dummyBoard[square] = playerId
            if board.isWin(gameBoard: dummyBoard) {
                result += [(squareId: square, minMax: 10)]
                break
            } else if emptySquares.count == 1  && !board.isWin(gameBoard: dummyBoard) {
                result += [(squareId: square, minMax: 0)]
                break
            } else {
                emptySquares.removeAtIndex(0)
                for var i = 0; i < emptySquares.count; ++i {
                    
                    if i % 2 == 0 && i < emptySquares.count {
                        dummyBoard[emptySquares[i]] = opponent
                        result += [(squareId: square, minMax: -1)]
                        if board.isWin(gameBoard: dummyBoard) {
                            break
                        }
                        
                    } else if i % 2 == 1 && i < emptySquares.count  {
                        dummyBoard[emptySquares[i]] = playerId
                        if board.isWin(gameBoard: dummyBoard) {
                            result += [(squareId: square, minMax: 1)]
                            break
                        }
                    }
                }
            }
            dummyBoard = currentBoard
            board.squaresSelectedDuringPlay = currentSquaresSelected
        }
        
        result.sort { $0.1 > $1.1 }
        return result.first!.squareId
    }
}












