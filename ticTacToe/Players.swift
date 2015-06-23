//
//  Players.swift
//  ticTacToe
//
//  Created by terry atkins on 09/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

public class Players {
   public var playerX :Int!
   public var playerO  :Int!

    public init() {
        playerX = 1
        playerO = 2
    }
    
    public func chooseWhoPlaysFirst(playerXorO : String) {
        if playerXorO == "x" {
            playerX = 1
            playerO = 2
        } else {
            playerX = 2
            playerO = 1
        }
    }
        
    public func nextPlayersTurn(playerId: Int) -> Int {
        return playerId == 1 ? 2 : 1
    }

}