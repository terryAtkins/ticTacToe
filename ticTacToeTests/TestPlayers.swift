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
        
    func testWhoIsPlayingWhom() {
        let players = Players()
        XCTAssert(players.whoIsPlayingWhom(1) == 1)
        XCTAssert(players.whoIsPlayingWhom(2) == 2)
        XCTAssert(players.whoIsPlayingWhom(3) == 3)
    }
    
    func testGameMethod () {
        let gameType = Players()
        XCTAssertTrue(gameType.chooseGameMethod(1))
        XCTAssertTrue(gameType.chooseGameMethod(2))
        XCTAssertTrue(gameType.chooseGameMethod(3))
        
    }
    
    func testWhichPlayerGoesFirst() {
        let firstPlayer = Players()
        XCTAssert(firstPlayer.chooseWhoGoesFirst(1) == 1)
        XCTAssert(firstPlayer.chooseWhoGoesFirst(2) == 2)
        XCTAssert(firstPlayer.chooseWhoGoesFirst(0) == 2)
    }
    
    func testNextPlayerTurn() {
        let player = Players()
        XCTAssert(player.nextPlayersTurn(1) == 2 )
        XCTAssert(player.nextPlayersTurn(2) == 1 )
        
    }

}
