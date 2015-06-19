//
//  GameBroad.swift
//  ticTacToe
//
//  Created by terry atkins on 09/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

public class GameBoard {
    
    public var gameSquares = [[0,0,0],[0,0,0],[0,0,0]] // needs to be public for testing in XCTest
    
    var bottomLeftSquare :Int?
    var bottomCenterSquare :Int? 
    var bottomRightSquare :Int?
    var middleLeftSquare :Int?
    var middleCenterSquare :Int?
    var middleRightSquare :Int?
    var topLeftSquare :Int?
    var topCenterSquare :Int?
    var topRightSquare :Int?
    var numberOfSquaresInAGames :Int
    
    
    public init() {
        numberOfSquaresInAGames = 9
    }
    
    public func upDateNames() {
        topLeftSquare = gameSquares[0][0]
        topCenterSquare = gameSquares[0][1]
        topRightSquare = gameSquares[0][2]
        middleLeftSquare = gameSquares[1][0]
        middleCenterSquare = gameSquares[1][1]
        middleRightSquare = gameSquares[1][2]
        bottomLeftSquare = gameSquares[2][0]
        bottomCenterSquare = gameSquares[2][1]
        bottomRightSquare = gameSquares[2][2]
    }
    
    public func updateGameBoardWhenSquareSelected(playerId player: Int, rowId row :Int, columnId column :Int ) {
        gameSquares[row][column] = player
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

    public func isSquareStillInPlay(rowId row:Int, columnId column :Int) -> Bool {
        if gameSquares[row][column] == 0 {
            return true
        }
        return false
    }
    
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
    
    public func resetBoard() {
        gameSquares = [[0,0,0],[0,0,0],[0,0,0]]
    }
    
    func resetSquare(rowId row:Int, columnId column :Int) {
        gameSquares[row][column] = 0
        increaseNumberOfSquaresLeftToPlayByOne()
    }

}


