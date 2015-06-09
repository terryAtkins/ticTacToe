//
//  GameBroad.swift
//  ticTacToe
//
//  Created by terry atkins on 09/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

public class GameBroad: NSObject {
    
    public func setGameForFirstPlay() -> [[Int]] {
        var gamesSquaresThreePerRowFromBottomLeftToTopRight = [[0,0,0],
            [0,0,0],
            [0,0,0]]
        return gamesSquaresThreePerRowFromBottomLeftToTopRight
    }
    
    public func hasPlayerSelectedThreeInARowHorizontal() -> Bool {
        
        var i = 0
        var j = 0
        var playerDidSelectThreeInARow:Bool?
        
        if setGameForFirstPlay()[i][j] == setGameForFirstPlay()[i][j + 1] && setGameForFirstPlay()[i][j] == setGameForFirstPlay()[i][j + 2] {
            playerDidSelectThreeInARow = true
        } else if setGameForFirstPlay()[i + 1][j] == setGameForFirstPlay()[i + 1][j + 1] && setGameForFirstPlay()[i][j] == setGameForFirstPlay()[i + 1][j + 2] {
            playerDidSelectThreeInARow = true
        } else if setGameForFirstPlay()[i + 1][j] == setGameForFirstPlay()[i + 1][j + 1] && setGameForFirstPlay()[i][j] == setGameForFirstPlay()[i + 1][j + 2] {
            playerDidSelectThreeInARow = true
        } else {
            playerDidSelectThreeInARow = false
        }
        
        return playerDidSelectThreeInARow!
    }
    
}
