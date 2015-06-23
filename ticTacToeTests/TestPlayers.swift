//
//  TestPlayers.swift
//  ticTacToe
//
//  Created by terry atkins on 14/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit
import XCTest
import ticTacToe

class TestPlayers: XCTestCase {
        
    func testGameMethod () {
        let gameType = Players()

//        
//        XCTAssertTrue(gameType.chooseGameMethod(1))
//        XCTAssertTrue(gameType.chooseGameMethod(2))
//        XCTAssertTrue(gameType.chooseGameMethod(3))
//        
    }
    
    func testChooseWhoPlaysFirst() {
        let firstPlayer = Players()
        firstPlayer.chooseWhoPlaysFirst("x")
        XCTAssert(firstPlayer.playerX == 1)
        firstPlayer.chooseWhoPlaysFirst("0")
        XCTAssert(firstPlayer.playerO == 1)
        XCTAssert(firstPlayer.playerX == 2)
    }
    
    func testNextPlayersTurn() {
        let player = Players()
        
        XCTAssert(player.nextPlayersTurn(1) == 2 )
        XCTAssert(player.nextPlayersTurn(2) == 1 )
        
    }

}
