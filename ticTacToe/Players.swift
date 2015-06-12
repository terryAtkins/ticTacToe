//
//  Players.swift
//  ticTacToe
//
//  Created by terry atkins on 09/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

public class Players :NSObject{
    let playerOne:Int
    let playerTwo:Int
    var turnsLeftToPlay:Int

   public override init() {
        self.playerOne = 1
        self.playerTwo = 2
        self.turnsLeftToPlay = 9
    }
    
    public  func numberOfTurnsLeftToPlay() -> Bool{

        while turnsLeftToPlay != 0 {
            turnsLeftToPlay -= 1
            return true
            
        }
        return false
    }
    
    public func chooseWhoGoesFirst(playerIdNumer : Int) -> Int {
        if playerIdNumer == 1 {
            return playerOne
        } else {
            return playerTwo
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
    

    
    public func chooseGameMethod(gameType :Int) -> Bool  {
        let gameType = gameType
        var result = false
        if gameType == 1 {
           result = humanVsHuman()
        } else if gameType == 2 {
              result = humanVsMachine()
        } else if gameType == 3 {
             result = machineVsMachine()
        }
        return result
    }
    
    func humanVsHuman() -> Bool {

        return true
    }
    
    func humanVsMachine() -> Bool{
        return true
    }
    
    func machineVsMachine() -> Bool{
        return true
    }
    
    public func nextPlayersTurn(playerId: Int) -> Int {
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