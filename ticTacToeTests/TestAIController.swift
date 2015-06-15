//
//  TestAIController.swift
//  ticTacToe
//
//  Created by terry atkins on 14/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit
import XCTest
import ticTacToe

class TestAIController: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }

    
    func testIsThisTheFirstSquareOfTheGameSelected() {
        let firstPlay = AIController()
        //        XCTAssertTrue(firstPlay.isThisTheFirstSquareOfTheGameSelected)
    }
    
    func testComputerHasTakenATurn() {
        let turnTaken = AIController()
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 1), "checking first turn")
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 1), "checking turns after the first")
    }
    

    func testAIController() {
        
        let computer = AIController()

        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 1))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 2, num: 2))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 2))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 1, num: 2))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 2))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 1, num: 2))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 2))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 2))
        
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 1, num: 5))
        
    }

}
