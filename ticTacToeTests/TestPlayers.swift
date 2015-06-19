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
        
        XCTAssertTrue(gameType.chooseGameMethod(1))
        XCTAssertTrue(gameType.chooseGameMethod(2))
        XCTAssertTrue(gameType.chooseGameMethod(3))
        
    }
    
    func testChooseWhoPlaysFirst() {
        let firstPlayer = Players()
        
        XCTAssert(firstPlayer.chooseWhoPlaysFirst(1) == 1)
        XCTAssert(firstPlayer.chooseWhoPlaysFirst(2) == 2)
        XCTAssert(firstPlayer.chooseWhoPlaysFirst(0) == 2)
    }
    
    func testNextPlayerTurn() {
        let player = Players()
        
        XCTAssert(player.nextPlayersTurn(1) == 2 )
        XCTAssert(player.nextPlayersTurn(2) == 1 )
        
    }

}
