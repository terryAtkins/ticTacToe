//
//  GameBroad.swift
//  ticTacToe
//
//  Created by terry atkins on 09/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

public class GameBroad: NSObject {
    
    public func gameBroadSquares() -> [[Int]] {
        var gameSquares = [[0,0,0],
            [0,0,0],
            [0,0,0]]
        return gameSquares
    }
    
    public func hasPlayerSelectedThreeInARowHorizontal() -> Bool {
        
        var playerDidSelectThreeInARow:Bool?
        
        let bottomLeftSquare = gameBroadSquares()[0][0]
        let bottomCenterSqaure = gameBroadSquares()[0][1]
        let bottomRightSquare = gameBroadSquares()[0][2]
        let middleLeftSquare = gameBroadSquares()[1][0]
        let middleCenterSquare = gameBroadSquares()[1][1]
        let middleRightSquare = gameBroadSquares()[1][2]
        let topLeftSquare = gameBroadSquares()[2][0]
        let topCenterSquare = gameBroadSquares()[2][1]
        let topRightSquare = gameBroadSquares()[2][2]

        if bottomLeftSquare == bottomCenterSqaure && bottomLeftSquare == bottomRightSquare {
            playerDidSelectThreeInARow = true
        } else if middleLeftSquare == middleCenterSquare && middleLeftSquare == middleRightSquare  {
            playerDidSelectThreeInARow = true
        } else if topLeftSquare == topCenterSquare && topLeftSquare == topRightSquare {
            playerDidSelectThreeInARow = true
        } else {
            playerDidSelectThreeInARow = false
        }
        
        return playerDidSelectThreeInARow!
    }
    
    public func hasPlayerSelectedThreeInARowVertical() -> Bool {
        
        var playerDidSelectThreeInARow:Bool?
    
        let bottomLeftSquare = gameBroadSquares()[0][0]
        let middleLeftSqaure = gameBroadSquares()[1][0]
        let topLeftSquare = gameBroadSquares()[2][0]
        let bottomCenterSquare = gameBroadSquares()[0][1]
        let middleCenterSquare = gameBroadSquares()[1][1]
        let topCenterSquare = gameBroadSquares()[2][1]
        let bottomRightSquare = gameBroadSquares()[0][2]
        let middleRightSquare = gameBroadSquares()[1][2]
        let topRightSquare = gameBroadSquares()[2][2]
        
        if bottomLeftSquare == middleLeftSqaure && bottomLeftSquare == topLeftSquare {
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
    
}


