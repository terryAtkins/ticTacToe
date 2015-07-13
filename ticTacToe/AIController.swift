
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
            if isFirstMoveAWinFor_cuurentPlayer(dummyBoard: dummyBoard) {
                result += [(squareId: square, minMax: 10)]
                break
            }
            
            if !board.isWin(gameBoard: dummyBoard) {
                if isFirstMoveAWinFor_opponent(dummyBoard: dummyBoard, square: square, playerToBlock: playerToBlock) {
                    result += [(squareId: square, minMax: 10)]
                    break
                }
            }
            
            if square == emptySquares.last && !board.isWin(gameBoard: dummyBoard) {
                result += [(squareId: square, minMax: 0)]
                break
                
            } else {
                result += findTheBestSquareToPlay(dummyBoard: dummyBoard, emptySquares: emptySquares, square: square, currentPlayer: currentPlayer, switchedPlayerId: switchedPlayerId)
            }
            
            dummyBoard = currentBoard
        }
        result.sort { $0.1 > $1.1 }
        return result.first!.squareId
    }

    
    func isFirstMoveAWinFor_cuurentPlayer(var #dummyBoard: [Int]) -> Bool {
        return board.isWin(gameBoard: dummyBoard)
    }
    
    func isFirstMoveAWinFor_opponent(var #dummyBoard: [Int], square: Int, playerToBlock: Int) -> Bool {
        dummyBoard[square] = playerToBlock
        return board.isWin(gameBoard: dummyBoard)
    }
    
    func findTheBestSquareToPlay(var #dummyBoard: [Int], emptySquares: [Int], square: Int, currentPlayer: Int, var switchedPlayerId: Int) -> [(squareId: Int, minMax: Int)] {
        dummyBoard[square] = currentPlayer
        var squareScore: [(squareId: Int, minMax: Int)] = []
        for remainingSquare in emptySquares {
            if dummyBoard[remainingSquare] == 0 {
                dummyBoard[remainingSquare] = switchedPlayerId
                if board.isWin(gameBoard: dummyBoard) {
                    if switchedPlayerId == currentPlayer {
                        squareScore += [(squareId: square, minMax: 1)]
                        break
                    } else {
                        squareScore += [(squareId: square, minMax: -1)]
                        break
                    }
                    
                } else if remainingSquare == emptySquares.last && !board.isWin(gameBoard: dummyBoard) {
                    squareScore += [(squareId: square, minMax: 0)]
                    break
                }
            }
            switchedPlayerId = switchedPlayerId == 1 ? 2 : 1
        }
        return squareScore
    }
}
























