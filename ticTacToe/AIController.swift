//
//  AIController.swift
//  ticTacToe
//
//  Created by terry atkins on 13/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

public class AIController :GameBoard {
    
    let players :Players
    let randomNumber: Int
    
    
    
    public  override init() {
        
        players = Players()
        randomNumber = Int(arc4random_uniform(UInt32(5)))
        
    }
    
    public func cpuToPlay(playerId player :Int) {
        
        let centerSquareStillInPlay = isSquareStillInPlay(rowId: 1, columnId: 1)
        
        if centerSquareStillInPlay {
            updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        } else {
            selectACornerSquare(playerId: player, ranNum: randomNumber)
        }
        
    }
    
    
    public func selectACornerSquare(playerId player:Int, ranNum num: Int) {
        let num = num
//        var randomNumber = Int(arc4random_uniform(UInt32(5)))
        switch num {
        case 1:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 0)
        case 2:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 2)
        case 3:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 0)
        case 4:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 2, columnId: 2)
        default:
            updateGameBoardWhenSquareSelected(playerId: player, rowId: 0, columnId: 0)
        }
    }
    
}