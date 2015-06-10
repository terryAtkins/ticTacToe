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
        var gameSqaures = [[0,0,0],
            [0,0,0],
            [0,0,0]]
        return gameSqaures
    }
    
    public func hasPlayerSelectedThreeInARowHorizontal() -> Bool {
        
        var playerDidSelectThreeInARow:Bool?
        var bottomLeftSquare = gameBroadSquares()[0][0]
        var bottomCenterSqaure = gameBroadSquares()[0][1]
        var bottomRightSquare = gameBroadSquares()[0][2]
        var middleLeftSquare = gameBroadSquares()[1][0]
        var middleCenterSquare = gameBroadSquares()[1][1]
        var middleRightSquare = gameBroadSquares()[1][2]
        var topLeftSquare = gameBroadSquares()[2][0]
        var topCenterSquare = gameBroadSquares()[2][1]
        var topRightSquare = gameBroadSquares()[2][2]

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
    
}
