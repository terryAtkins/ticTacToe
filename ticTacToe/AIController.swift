
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
        
        var currentPlayer = board.squareOwner
        var currentBoard = board.gameSquares
        var dummyBoard = currentBoard
        var emptySquares = board.searchForEmptySquares()
        var switchedPlayerId = currentPlayer == 1 ? 2 : 1
        let playerToBlock = switchedPlayerId
        var result: [(squareId: Int, minMax: Int)] = []
        
        for square in emptySquares {
            dummyBoard[square] = currentPlayer
            if board.isWin(gameBoard: dummyBoard) {
                result += [(squareId: square, minMax: 10)]
                break
            }
            
            if !board.isWin(gameBoard: dummyBoard) {
                dummyBoard[square] = playerToBlock
                if board.isWin(gameBoard: dummyBoard) {
                    result += [(squareId: square, minMax: 10)]
                    break
                }
            }
            
            if square == emptySquares.last && !board.isWin(gameBoard: dummyBoard) {
                result += [(squareId: square, minMax: 0)]
                break
            } else {
                dummyBoard[square] = currentPlayer
                
                for remainingSquare in emptySquares {
                    if dummyBoard[remainingSquare] == 0 {
                        dummyBoard[remainingSquare] = switchedPlayerId
                        if board.isWin(gameBoard: dummyBoard) {
                            if switchedPlayerId == currentPlayer {
                                result += [(squareId: square, minMax: 1)]
                                break
                            } else {
                                result += [(squareId: square, minMax: -1)]
                                break
                            }
                        } else if remainingSquare == emptySquares.last && !board.isWin(gameBoard: dummyBoard) {
                            result += [(squareId: square, minMax: 0)]
                            break
                        }
                    }
                    
                    switchedPlayerId = switchedPlayerId == 1 ? 2 : 1
                }
            }
            
            dummyBoard = currentBoard
        }
        result.sort { $0.1 > $1.1 }
        return result.first!.squareId
    }
    
}

          






















