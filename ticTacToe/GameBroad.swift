//
//  GameBroad.swift
//  ticTacToe
//
//  Created by terry atkins on 09/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

public class GameBoard {
    
    public var gameSquares = [0,0,0,0,0,0,0,0,0] // public for testing in XCTest
    public var squaresSelectedDuringPlay = [Int]()
    var player = 1 // put back in isWin
    
    public init() {
    }
    
    public func isSquareStillInPlay(squareId square :Int) -> Bool {
        return gameSquares[square] == 0
    }
    
    public func updateGameBoardWithSelectedSquare(squareId square :Int) {
        squaresSelectedDuringPlay.append(square)
        gameSquares[square] = squaresSelectedDuringPlay.count % 2 == 0 ? 1 : 2
    }

    public func searchForEmptySquares() -> [Int] {
        var emptySquares = [Int]()
        
        for var i = 0; i < gameSquares.count; ++i {
            if gameSquares[i] == 0 {
                emptySquares.append(i)
            }
        }
        return emptySquares
    }
    
    public func resetBoard() {
        gameSquares = [0,0,0,0,0,0,0,0,0]
        squaresSelectedDuringPlay = [Int]()
    }
    
    func resetSquaresSelectedDuringPlay() {
        squaresSelectedDuringPlay = [Int]()
    }
    
    func resetSquare(squareId square :Int) {
        gameSquares[square] = 0
        squaresSelectedDuringPlay.removeLast()
    }
    
    public func isWin(#gameBoard: [Int]) -> Bool {
        player = squaresSelectedDuringPlay.count % 2 == 0 ? 1 : 2
        return checkHorizontal(gameBoard: gameBoard, playerId: player) || checkVertical(gameBoard: gameBoard, playerId: player)  || checkDiagonal(gameBoard: gameBoard, playerId: player)
    }
    
    func checkHorizontal(#gameBoard :[Int], playerId: Int) -> Bool {
        for var i = 0; i < gameBoard.count - 1; i += 3 {
            if gameBoard[i] == playerId && gameBoard[i] == gameBoard[i + 1] && gameBoard[i] == gameBoard[i + 2] {
                return true
            }
        }
        return false
    }
    
    func checkVertical(#gameBoard :[Int], playerId: Int) -> Bool {
        for var i = 0; i < 3; ++i {
            if gameBoard[i] == playerId && gameBoard[i] == gameBoard[i + 3] && gameBoard[i] == gameBoard[i + 6] {
                return true
            }
        }
        return false
    }
    
    func checkDiagonal(#gameBoard :[Int], playerId: Int) -> Bool {
        return gameBoard[0] == playerId &&  gameBoard[0] == gameBoard[4] && gameBoard[0] == gameBoard[8] ||
            gameBoard[2] == playerId && gameBoard[2] == gameBoard[4] && gameBoard[2] == gameBoard[6]
    }
}


