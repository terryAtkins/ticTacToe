//
//  GameBroad.swift
//  ticTacToe
//
//  Created by terry atkins on 09/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

public class GameBoard {
    
    public var gameSquares = [0,0,0,0,0,0,0,0,0] // needs to be public for testing in XCTest
    
    var bottomLeftSquare :Int!
    var bottomCenterSquare :Int!
    var bottomRightSquare :Int!
    var middleLeftSquare :Int!
    var middleCenterSquare :Int!
    var middleRightSquare :Int!
    var topLeftSquare :Int!
    var topCenterSquare :Int!
    var topRightSquare :Int!
    var numberOfSquaresInAGames = 9
    
    public init() {
//        numberOfSquaresInAGames = 9
    }
    
    public func upDateNames() {
        topLeftSquare = gameSquares[0]
        topCenterSquare = gameSquares[1]
        topRightSquare = gameSquares[2]
        middleLeftSquare = gameSquares[3]
        middleCenterSquare = gameSquares[4]
        middleRightSquare = gameSquares[5]
        bottomLeftSquare = gameSquares[6]
        bottomCenterSquare = gameSquares[7]
        bottomRightSquare = gameSquares[8]
    }
    
    public func updateGameBoardWithSelectedSquare(playerId player: Int, squareId square :Int) {
        gameSquares[square] = player
        reduceNumberOfSquaresLeftToPlayByOne()
       
    }
    
    public  func reduceNumberOfSquaresLeftToPlayByOne() -> Int {
        if numberOfSquaresInAGames != 0 {
            numberOfSquaresInAGames -= 1
        }
        return numberOfSquaresInAGames
    }
    
    public func increaseNumberOfSquaresLeftToPlayByOne()  -> Int {
        numberOfSquaresInAGames += 1
        return numberOfSquaresInAGames
    }
    
    public func squaresLeftInGame() -> Int {
        return numberOfSquaresInAGames
    }
    
    public func resetNumberOfSquaresLeftToPlay() -> Int {
        numberOfSquaresInAGames = 9
        return numberOfSquaresInAGames
    }

    public func isSquareStillInPlay(squareId square :Int) -> Bool {
        if gameSquares[square] == 0 {
            return true
        }
        return false
    }
    
    public func searchForEmptySquares() -> [Int] {
        var i = 0
        var emptySquares = [Int]()
        
        while i < gameSquares.count {
            if gameSquares[i] == 0 {
                emptySquares.append(i)
            }
            i += 1
        }
        
        return emptySquares
        
//        for square in gameSquares {
//
//                if isSquareStillInPlay(squareId: square) {
//                    emptySquares.append(square)
//                }
//            }
//
//        return emptySquares
    }
    
    public func resetBoard() {
        gameSquares = [0,0,0,0,0,0,0,0,0]
        numberOfSquaresInAGames = 9
    }
    
    func resetSquare(squareId square :Int) {
        gameSquares[square] = 0
        increaseNumberOfSquaresLeftToPlayByOne()
    }

}


