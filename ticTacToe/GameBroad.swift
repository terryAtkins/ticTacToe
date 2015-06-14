//
//  GameBroad.swift
//  ticTacToe
//
//  Created by terry atkins on 09/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

public class GameBoard {
    
     public var gameSquares = [[0,0,0],[0,0,0],[0,0,0]]
//    var gameSquares = [[0,0,0],[0,0,0],[0,0,0]]
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
        
        upDateNames()
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
    
    
    public func twoInARowDiagonal() -> Int {
        var playerDidSelectTwoInARow = 0
        
        if bottomLeftSquare != 0 && middleCenterSquare != 0 {
            if bottomLeftSquare == middleCenterSquare {
            playerDidSelectTwoInARow += 1
            }
        }
        
        if bottomLeftSquare != 0 && topRightSquare != 0 {
            if bottomLeftSquare == topRightSquare {
            playerDidSelectTwoInARow += 1
            }
        }
        
        if topLeftSquare == middleCenterSquare {
            playerDidSelectTwoInARow += 1
        }
        
        if topLeftSquare == bottomRightSquare {
            playerDidSelectTwoInARow += 1
        }
        
        return playerDidSelectTwoInARow
    }

//    public func checkForTwoInARowToBlock() -> Bool {
//        var result = false
//        if twoInARowVertical() > 0 || twoInARowHorizontal() > 0 || twoInARowDiagonal() > 0 {
//            result = true
//        }
//        
//        return result
//    }
    
    public func threeInARowVertical() -> Bool {
        
        upDateNames()
        var playerDidSelectThreeInARow :Bool?
        
        if bottomLeftSquare != 0 {
            if bottomLeftSquare == middleCenterSquare && bottomLeftSquare == topLeftSquare {
                playerDidSelectThreeInARow = true
                
            }
        }
            
        else if bottomCenterSquare != 0 {
            if bottomCenterSquare == middleCenterSquare && bottomCenterSquare == topCenterSquare  {
                playerDidSelectThreeInARow = true
                
            }
        }
            
        else if bottomRightSquare != 0 {
            if bottomRightSquare == middleRightSquare && bottomRightSquare == topRightSquare {
                playerDidSelectThreeInARow = true
                
            }
        } else {
            playerDidSelectThreeInARow = false
            
            
        }
        return playerDidSelectThreeInARow!
    }
    
    public func threeInARowHorizontal() -> Bool {
        
        upDateNames()
        var playerDidSelectThreeInARow = false
        
        if bottomLeftSquare != 0 {
            if bottomLeftSquare == bottomCenterSquare && bottomLeftSquare == bottomRightSquare {
                playerDidSelectThreeInARow = true
            }
            
        } else if middleLeftSquare != 0 {
            if middleLeftSquare == middleCenterSquare && middleLeftSquare == middleRightSquare  {
                playerDidSelectThreeInARow = true
            }
            
        } else if topLeftSquare != 0 {
            if topLeftSquare == topCenterSquare && topLeftSquare == topRightSquare {
                playerDidSelectThreeInARow = true
            }
            
        }
        
        return playerDidSelectThreeInARow
    }
    
    public func threeInARowDiagonal() -> Bool {
        
        upDateNames()
        var playerDidSelectThreeInARow = false
        
        if bottomLeftSquare != 0 {
            if bottomLeftSquare == middleCenterSquare && bottomLeftSquare == topRightSquare {
                playerDidSelectThreeInARow = true
        }
        
        } else if topLeftSquare != 0 {
            if topLeftSquare == middleCenterSquare && topLeftSquare == bottomRightSquare {
                playerDidSelectThreeInARow = true
        }
        
        }
        
        return playerDidSelectThreeInARow
    }
    
//    public func checkForThreeInARowToWin() -> Bool {
//        var result = false
//        if threeInARowVertical() || threeInARowHorizontal() || threeInARowDiagonal() {
//            result = true
//        }
//        
//        return result
//    }
}


