//
//  AIController.swift
//  ticTacToe
//
//  Created by terry atkins on 13/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

public class AIController :GameBoard {
    
    public let players :Players // needs to be public for testing in XCTest
    var howManyTurnsHaveYouHad :Int
    
    public override init() {
        
        players = Players()
        howManyTurnsHaveYouHad = 0
    }
    
    public func computersTurnToPlay(playerId player :Int) -> Bool {
        
        if isFirstPlayer_selectACornerOrMiddleSqaure(playerId: player) || isSecondPlayerAndFirstGo_playTheMiddleOrACorner(playerId: player) ||
            isClosingStagesOfTheGame_playMiniMax(playerId: player) {
                
                players.reduceNumberOfTurnsLeftToPlayByOne()
                howManyTurnsHaveYouHad -= 1
                return true
        }
        return false
    }
    
    func isFirstPlayer_selectACornerOrMiddleSqaure(playerId player :Int) -> Bool {
        if howManyTurnsHaveYouHad == 0 && players.turnsLeftInGame() == 9 {
            if selectACornerOrMiddleSquare(playerId: player) {
                return true
            }
        }
        return false
    }
    
    public func selectACornerOrMiddleSquare(playerId player :Int) -> Bool  {
        
        switch Int(arc4random_uniform(UInt32(5))) {
        case 0:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 0)
            return true
        case 1:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 2)
            return true
        case 2:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 0)
            return true
        case 3:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 2)
            return true
        case 4:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 1, columnId: 1)
            return true
        default:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 1, columnId: 1)
            return true
        }
    }
    
    func isSecondPlayerAndFirstGo_playTheMiddleOrACorner(playerId player :Int) -> Bool {
        if howManyTurnsHaveYouHad == 1 && players.turnsLeftInGame() >= 7 {
            if playTheMiddleSquareOrFindACornerToPlay(playerId: player) {
                return true
            }
        }
        return false
    }
    
    public func playTheMiddleSquareOrFindACornerToPlay(playerId player :Int) -> Bool {
        
        upDateNames()
        
        if isSquareStillInPlay(rowId: 1, columnId: 1) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 1, columnId: 1)
            return true
        } else if isSquareStillInPlay(rowId: 0, columnId: 0) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 0)
            return true
        } else if isSquareStillInPlay(rowId: 0, columnId: 2) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 2)
            return true
        } else if isSquareStillInPlay(rowId: 2, columnId: 0) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 0)
            return true
        } else if isSquareStillInPlay(rowId: 2, columnId: 2) {
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 2)
            return true
        }
        return false
    }
    
    func isClosingStagesOfTheGame_playMiniMax(playerId player :Int) -> Bool {
        if players.turnsLeftInGame() >= 1{
            if miniMax() {
                return true
            }
        }
        return false
    }
    
    public func miniMax() -> Bool {
        var max = 0
        var min = 0
        return true
    }
}