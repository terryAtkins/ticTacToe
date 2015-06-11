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
    private let bottomLeftSquare:Int?
    private let bottomCenterSquare:Int?
    private let bottomRightSquare:Int?
    private let middleLeftSquare:Int?
    private let middleCenterSquare:Int?
    private let middleRightSquare:Int?
    private let topLeftSquare:Int?
    private let topCenterSquare:Int?
    private let topRightSquare:Int?
    
    
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
    
    public func resetBoard() {
        gameSquares = [[0,0,0],[0,0,0],[0,0,0]]
    }
    
    public func hasSquareBeenSelectedDuringPlay(squareId :Int) -> Bool {
        let squareId = squareId
        var result = false
        while squareId != 0 {
        result = true
            return result
        }
        return result
    }
    
    public func horizontal() -> Bool {
        
        var playerDidSelectThreeInARow = false
        var i = 0
        var j = 0
        var l = gameSquares.count - 1
        while i < l {
                if gameSquares[i][j] == gameSquares[i][j + 1] && gameSquares[i][j] == gameSquares[i][j + 1] {
                    playerDidSelectThreeInARow = true
                }
        ++i
        }
        
//        if bottomLeftSquare == bottomCenterSquare && bottomLeftSquare == bottomRightSquare {
//            playerDidSelectThreeInARow = true
//        } else if middleLeftSquare == middleCenterSquare && middleLeftSquare == middleRightSquare  {
//            playerDidSelectThreeInARow = true
//        } else if topLeftSquare == topCenterSquare && topLeftSquare == topRightSquare {
//            playerDidSelectThreeInARow = true
//        } else {
//            playerDidSelectThreeInARow = false
//        }
//        
        return playerDidSelectThreeInARow
    }
    
//    public func horizontal() -> Bool {
//        
//        var playerDidSelectThreeInARow:Bool?
//        
//        if bottomLeftSquare == bottomCenterSquare && bottomLeftSquare == bottomRightSquare {
//            playerDidSelectThreeInARow = true
//        } else if middleLeftSquare == middleCenterSquare && middleLeftSquare == middleRightSquare  {
//            playerDidSelectThreeInARow = true
//        } else if topLeftSquare == topCenterSquare && topLeftSquare == topRightSquare {
//            playerDidSelectThreeInARow = true
//        } else {
//            playerDidSelectThreeInARow = false
//        }
//        
//        return playerDidSelectThreeInARow!
//    }
    
    
    public func vertical() -> Bool {
        
        var playerDidSelectThreeInARow:Bool?
        
        if bottomLeftSquare == middleLeftSquare && bottomLeftSquare == topLeftSquare {
            playerDidSelectThreeInARow = true
        } else if bottomCenterSquare == middleCenterSquare && bottomCenterSquare == topCenterSquare  {
            playerDidSelectThreeInARow = true
        } else if bottomRightSquare == middleRightSquare && bottomRightSquare == topRightSquare {
            playerDidSelectThreeInARow = true
        } else {
            playerDidSelectThreeInARow = false
        }
        
        return playerDidSelectThreeInARow!
    }
    
    
    public func diagonal() -> Bool {
        var playerDidSelectThreeInARow:Bool?
        
        if bottomLeftSquare == middleCenterSquare && bottomLeftSquare == topRightSquare {
            return true
        } else if topLeftSquare == middleCenterSquare && topLeftSquare == bottomRightSquare {
            return true
        } else {
            return false
        }
    }
    
}


