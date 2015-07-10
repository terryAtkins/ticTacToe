////
////  MiniMax.swift
////  ticTacToe
////
////  Created by terry atkins on 09/07/2015.
////  Copyright (c) 2015 terry atkins. All rights reserved.
////
//
//import Foundation
//
//public class MiniMax {
//    
//    public let board = GameBoard()
//    
//    public init(){
//    }
//    
//    public func miniMax(var #dummyBoard :[Int], playerId : Int) -> Int {
//        
//        var currentBoard = board.gameSquares
//        var dummyBoard = currentBoard
//        
//        var emptySquares = board.searchForEmptySquares()
//        let opponent = playerId == 1 ? 2 : 1
//        var result: [(squareId: Int, minMax: Int)] = []
//        var score = 0
//        
//        for square in emptySquares {
//            dummyBoard[square] = playerId
//            if board.isWin(gameBoard: dummyBoard) {
//                score += 10
//                result += [(squareId: square, minMax: score)]
//                break
//            } else if square == emptySquares.count - 1 && !board.isWin(gameBoard: dummyBoard) {
//                score += 0
//                result += [(squareId: square, minMax: score)]
//                break
//            } else {
//                emptySquares.removeAtIndex(0)
//                for var i = 0; i < emptySquares.count; ++i {
//                    if i % 2 == 0 && i < emptySquares.count  {
//                        dummyBoard[emptySquares[i]] = opponent
//                        if board.isWin(gameBoard: dummyBoard) {
//                            score += -1
//                            result += [(squareId: square, minMax: score)]
//                            break
//                        } else {
//                            if i == emptySquares.count - 1 && !board.isWin(gameBoard: dummyBoard) {
//                                score += 0
//                                result += [(squareId: square, minMax: score)]
//                                break
//                            }
//                        }
//                        
//                    } else if i % 2 == 1 && i < emptySquares.count  {
//                        dummyBoard[emptySquares[i]] = playerId
//                        if board.isWin(gameBoard: dummyBoard) {
//                            score += 1
//                            result += [(squareId: square, minMax: score)]
//                            break
//                        } else {
//                            if i == emptySquares.count - 1 && !board.isWin(gameBoard: dummyBoard) {
//                                score += 0
//                                result += [(squareId: square, minMax: score)]
//                                break
//                            }
//                        }
//                    }
//                }
//            }
//            dummyBoard = currentBoard
//            result += [(squareId: square, minMax: score)]
//        }
//        
//        result.sort { $0.1 > $1.1 }
//        return result.first!.squareId
//        
//        
//    }
//    
//    
//    
//}
//
//
//
//
//
//
//
//
//
