
//
//  GameController.swift
//  ticTacToe
//
//  Created by terry atkins on 13/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

public class GameController :AIController {
    let board = GameBoard()
    let players = Players()
   public var playerId :Int // needs to be public for testing 
    var cpu :Int
    
    public override init() {
        playerId = 1
        cpu = 2
    }
    
    //    public func NewGame(#gameType :Int, playersShape playingFirst :Int) {
    //
//            let player1 = playingFirst
    //    }
    
//    public enum GameType :Int {
//        case humanVsMachine = 1
//        case humanVsHuman   = 2
//        case machineVsMachine = 3
//    }
    
//    public enum PlayerGoingFirst :Int {
//        case human = 1
//        case computer = 2
//    }
    
//    public func whichPlayerGoesFirstHumanOrMachine(#playerToGoFirst :PlayerGoingFirst) {
//        if playerToGoFirst == PlayerGoingFirst.human {
//            cpu = 2
//            playerId = 1
//        } else {
//            cpu = 1
//            playerId = 2
//        }
//    }
    
//    public func chooseGameMethod(#gameType :GameType, playerId player :Int, squareId square :Int) {
//        let gameType = gameType
//        
//        switch gameType {
//        case .humanVsMachine:
//            humanVsMachine(squareId: square)
//        case .humanVsHuman:
//            humanVsHuman(squareId: square)
//        case .machineVsMachine:
//            machineVsMachine()
//        default:
//            humanVsMachine(squareId: square)
//        }
//    }
    
    public func humanVsMachine(squareId square :Int) {
//        cpu = playerId == 1 ? 2 : 1
        if cpu == 1 && squaresLeftInGame() % 2 != 0 {
            computersTurnToPlay(playerId: cpu)
            
        } else if humanHasTakenTurn(squareId: square) {
            computersTurnToPlay(playerId: cpu)
            
        } else {
            computersTurnToPlay(playerId: cpu)
        }
    }
    
    public func humanVsHuman(squareId square :Int) -> Bool {
        if humanHasTakenTurn(squareId: square) {
            playerId = switchPlayersId(playerId: playerId)
            return true
        }
        return false
    }
    
    func checkForAWin() -> Bool {
        return checkForThreeInARow()
    }
    
    public func machineVsMachine() {
        var cpuX = 1
        var cpuO = 2
        while squaresLeftInGame() > 0 {
            if squaresLeftInGame() % 2 != 0 {
                computersTurnToPlay(playerId: cpuX)
            } else {
                computersTurnToPlay(playerId: cpuO)
            }
        }
    }
    
    public func humanHasTakenTurn(squareId square :Int) -> Bool {
        if isSquareStillInPlay(squareId: square) {
            updateGameBoardWithSelectedSquare(playerId: playerId, squareId: square)
            return true
        }
        return false
    }

}




