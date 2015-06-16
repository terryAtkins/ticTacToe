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

    func testPlayTheMiddleSquareOrFindACornerToPlay() {
        let computer = AIController()
        
        XCTAssertTrue(computer.isSquareStillInPlay(rowId: 1, columnId: 1))
        computer.playTheMiddleSquareOrFindACornerToPlay(playerId: 1)
        XCTAssertEqual(computer.gameSquares[1][1], 1, "Test middle square")
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 1, columnId: 1))
        
        XCTAssertTrue(computer.isSquareStillInPlay(rowId: 0, columnId: 0))
        computer.playTheMiddleSquareOrFindACornerToPlay(playerId: 2)
        XCTAssertEqual(computer.gameSquares[0][0], 2, "Test topLeft square")
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 0, columnId: 0))
        
        XCTAssertTrue(computer.isSquareStillInPlay(rowId: 0, columnId: 2))
        computer.playTheMiddleSquareOrFindACornerToPlay(playerId: 1)
        XCTAssertEqual(computer.gameSquares[0][2], 1, "Test topRight square")
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 0, columnId: 2))
        
        XCTAssertTrue(computer.isSquareStillInPlay(rowId: 2, columnId: 0))
        computer.playTheMiddleSquareOrFindACornerToPlay(playerId: 2)
        XCTAssertEqual(computer.gameSquares[2][0], 2, "Test bottomLeft square")
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 2, columnId: 0))
        
        XCTAssertTrue(computer.isSquareStillInPlay(rowId: 2, columnId: 2))
        computer.playTheMiddleSquareOrFindACornerToPlay(playerId: 1)
        XCTAssertEqual(computer.gameSquares[2][2], 1, "Test bottomRight square")
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 2, columnId: 2))
        
        
//        computer.playTheMiddleSquareOrFindACornerToPlay(playerId: 2)
//        XCTAssertEqual(computer.gameSquares[1][1], 1, "Test middle square has not been updated to player 2")
        
    }
}


























