//
//  GameBroad.swift
//  ticTacToe
//
//  Created by terry atkins on 09/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

public class GameBoard: NSObject {
    
    public var gameSquares = [[0,0,0],[0,0,0],[0,0,0]]
    private let bottomLeftSquare :Int
    private let bottomCenterSquare :Int
    private let bottomRightSquare :Int
    private let middleLeftSquare :Int
    private let middleCenterSquare :Int
    private let middleRightSquare :Int
    private let topLeftSquare :Int
    private let topCenterSquare :Int
    private let topRightSquare :Int
    
    public override init() {
                
        bottomLeftSquare = gameSquares[0][0]
        bottomCenterSquare = gameSquares[0][1]
        bottomRightSquare = gameSquares[0][2]
        middleLeftSquare = gameSquares[1][0]
        middleCenterSquare = gameSquares[1][1]
        middleRightSquare = gameSquares[1][2]
        topLeftSquare = gameSquares[2][0]
        topCenterSquare = gameSquares[2][1]
        topRightSquare = gameSquares[2][2]
    }
    
    public func updateGameBoardWhenSquareSelected(playerId player: Int, rowId row :Int, columnId column :Int ) {
//        let player = player
//        let row = row
//        let column = column
        gameSquares[row][column] = player
    }
    
    public func resetBoard() {
        gameSquares = [[0,0,0],[0,0,0],[0,0,0]]
    }
    
    public func isSquareStillInPlay(rowId row:Int, columnId column :Int) -> Bool {
//        let row = row
//        let column  = column
        
        var result = false
        if gameSquares[row][column] == 0 {
        result = true
            return result
        }
        return result
    }
    
    public func twoInARowHorizontal() -> Bool {
        
        var playerDidSelectTwoInARow = false
        
        if bottomLeftSquare == bottomCenterSquare && bottomLeftSquare == bottomRightSquare {
            playerDidSelectTwoInARow = true
        } else if middleLeftSquare == middleCenterSquare && middleLeftSquare == middleRightSquare  {
            playerDidSelectTwoInARow = true
        } else if topLeftSquare == topCenterSquare && topLeftSquare == topRightSquare {
            playerDidSelectTwoInARow = true
        }
        
        return playerDidSelectTwoInARow
    }
    
    
    public func twoInARowVertical() -> Bool {
        
        var playerDidSelectTwoInARow = false
        
        if bottomLeftSquare == middleLeftSquare && bottomLeftSquare == topLeftSquare {
            playerDidSelectTwoInARow = true
        } else if bottomCenterSquare == middleCenterSquare && bottomCenterSquare == topCenterSquare  {
            playerDidSelectTwoInARow = true
        } else if bottomRightSquare == middleRightSquare && bottomRightSquare == topRightSquare {
            playerDidSelectTwoInARow = true
        }
        
        return playerDidSelectTwoInARow
    }
    
    
    public func twoInARowDiagonal() -> Bool {
        var playerDidSelectTwoInARow = false
        
        if bottomLeftSquare == middleCenterSquare && bottomLeftSquare == topRightSquare {
            playerDidSelectTwoInARow = true
        } else if topLeftSquare == middleCenterSquare && topLeftSquare == bottomRightSquare {
            playerDidSelectTwoInARow = true
        }
        
        return playerDidSelectTwoInARow
    }

    public func checkForTwoInARowToBlock() -> Bool {
        var result = false
        if twoInARowVertical() || twoInARowHorizontal() || twoInARowDiagonal() {
            result = true
        }
        
        return result
    }
    
    public func threeInARowHorizontal() -> Bool {
        
        var playerDidSelectThreeInARow = false
        
        if bottomLeftSquare == bottomCenterSquare && bottomLeftSquare == bottomRightSquare {
            playerDidSelectThreeInARow = true
        } else if middleLeftSquare == middleCenterSquare && middleLeftSquare == middleRightSquare  {
            playerDidSelectThreeInARow = true
        } else if topLeftSquare == topCenterSquare && topLeftSquare == topRightSquare {
            playerDidSelectThreeInARow = true
        }
        
        return playerDidSelectThreeInARow
    }
    
    
    public func threeInARowVertical() -> Bool {
        
        var playerDidSelectThreeInARow = false
        
        if bottomLeftSquare == middleLeftSquare && bottomLeftSquare == topLeftSquare {
            playerDidSelectThreeInARow = true
        } else if bottomCenterSquare == middleCenterSquare && bottomCenterSquare == topCenterSquare  {
            playerDidSelectThreeInARow = true
        } else if bottomRightSquare == middleRightSquare && bottomRightSquare == topRightSquare {
            playerDidSelectThreeInARow = true
        }
        
        return playerDidSelectThreeInARow
    }
    
    
    public func threeInARowDiagonal() -> Bool {
        var playerDidSelectThreeInARow = false
        
        if bottomLeftSquare == middleCenterSquare && bottomLeftSquare == topRightSquare {
            playerDidSelectThreeInARow = true
        } else if topLeftSquare == middleCenterSquare && topLeftSquare == bottomRightSquare {
            playerDidSelectThreeInARow = true
        }
        
        return playerDidSelectThreeInARow
    }
    
    public func checkForThreeInARowToWin() -> Bool {
        var result = false
        if threeInARowVertical() || threeInARowHorizontal() || threeInARowDiagonal() {
            result = true
        }
        
        return result
    }
}


