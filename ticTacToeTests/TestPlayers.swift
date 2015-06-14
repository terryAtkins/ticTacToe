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
    
    func testNumberOfTurnsLeftToPlay() {
        let turnsLeft = Players()
        XCTAssertEqual(turnsLeft.resetNumberOfTurnsLeftToPlay(), 9, "Should start with 9 turns")
        XCTAssertEqual(turnsLeft.reduceNumberOfTurnsLeftToPlayByOne(), 8, "Should return 8")
        XCTAssertEqual(turnsLeft.reduceNumberOfTurnsLeftToPlayByOne(), 7, "Should return 7")
        XCTAssertEqual(turnsLeft.reduceNumberOfTurnsLeftToPlayByOne(), 6, "Should return 6")
        XCTAssertEqual(turnsLeft.reduceNumberOfTurnsLeftToPlayByOne(), 5, "Should return 5")
        XCTAssertEqual(turnsLeft.reduceNumberOfTurnsLeftToPlayByOne(), 4, "Should return 4")
        XCTAssertEqual(turnsLeft.reduceNumberOfTurnsLeftToPlayByOne(), 3, "Should return 3")
        XCTAssertEqual(turnsLeft.reduceNumberOfTurnsLeftToPlayByOne(), 2, "Should return 2")
        XCTAssertEqual(turnsLeft.reduceNumberOfTurnsLeftToPlayByOne(), 1, "Should return 1")
        XCTAssertEqual(turnsLeft.reduceNumberOfTurnsLeftToPlayByOne(), 0, "Should return 0")
        XCTAssertNotEqual(turnsLeft.reduceNumberOfTurnsLeftToPlayByOne(), -1, "should not be lower then 0")
    }
    
    func testResetNumberOfTurnsLeftToPlay() {
        let turnsLeft = Players()
        XCTAssertEqual(turnsLeft.resetNumberOfTurnsLeftToPlay(), 9, "Should start with 9 turns")
        
        XCTAssertEqual(turnsLeft.reduceNumberOfTurnsLeftToPlayByOne(), 8, "Should return 8")
        turnsLeft.reduceNumberOfTurnsLeftToPlayByOne()
        turnsLeft.reduceNumberOfTurnsLeftToPlayByOne()
        turnsLeft.reduceNumberOfTurnsLeftToPlayByOne()
        turnsLeft.reduceNumberOfTurnsLeftToPlayByOne()
        turnsLeft.reduceNumberOfTurnsLeftToPlayByOne()
        XCTAssertEqual(turnsLeft.reduceNumberOfTurnsLeftToPlayByOne(), 2, "Should return 2")
        XCTAssertEqual(turnsLeft.resetNumberOfTurnsLeftToPlay(), 9, "Should start with 9 turns")
    }
    
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
