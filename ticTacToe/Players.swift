//
//  Players.swift
//  ticTacToe
//
//  Created by terry atkins on 09/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

public struct Players {
    let playerOne:Int?
    let playerTwo:Int?
    
   public init() {
        playerOne = 1
        playerTwo = 2
    }
    
    public func chooseWhoGoesFirst(playerIdNumer : Int) -> Int {
        if playerIdNumer == 1 {
            return playerOne!
        } else {
            return playerTwo!
        }
    }
    
    public func whoIsPlayingWhom(players: Int) -> Int {
        let players = players
        var result:()
        if players == 1 {
            return 1
        } else if players == 2 {
            return 2
        } else {
            return 3
        }
    }
    

    
//    public func gameMethod(gameType :Int) -> () {
//        let gameType = gameType
//        if gameType == 1 {
//           return humanVsHuman()
//        } else if gameType == 2 {
//            return humanVsMachine()
//        } else if gameType == 3 {
//           return  machineVsMachine()
//        }
//    }
    
    func humanVsHuman() {
        
    }
    
    func humanVsMachine() {
        
    }
    
    func machineVsMachine() {
        
    }
    
    public func playerToPlayNext(playerId: Int) -> Int {
        var currentPlayer = playerId
        if currentPlayer == 1 {
            currentPlayer = 2
            return currentPlayer

        } else {
            currentPlayer = 1
            return currentPlayer
        }
    }
    
}