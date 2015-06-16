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
    
    public init() {
        
    }
    
    public func upDateNames() {
        
        bottomLeftSquare = gameSquares[2][0]
        bottomCenterSquare = gameSquares[2][1]
        bottomRightSquare = gameSquares[2][2]
        middleLeftSquare = gameSquares[1][0]
        middleCenterSquare = gameSquares[1][1]
        middleRightSquare = gameSquares[1][2]
        topLeftSquare = gameSquares[0][0]
        topCenterSquare = gameSquares[0][1]
        topRightSquare = gameSquares[0][2]
    }
    
    public func updateGameBoardWhenSquareSelected(playerId player: Int, rowId row :Int, columnId column :Int ) {
        
        gameSquares[row][column] = player

    }
    
    public func isSquareStillInPlay(rowId row:Int, columnId column :Int) -> Bool {
        
        if gameSquares[row][column] == 0 {
            
            return true
        }
        
        return false
    }
    
    public func resetBoard() {
        
        gameSquares = [[0,0,0],[0,0,0],[0,0,0]]
    }

}


