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

    func testIsThisTheFirstSquareOfTheGameSelected() {
        let firstPlay = AIController()
        //        XCTAssertTrue(firstPlay.isThisTheFirstSquareOfTheGameSelected)
    }
    
    func testComputerHasTakenATurn() {
        let turnTaken = AIController()
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 1), "checking first turn")
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 1), "checking turns after the first")
    }
    
    //     can only be tested if selectACornerSquare is manually passed numbers
    //     via a paramater and removing randomNumber from the function
    //    func testAIController() {
    //
    //        let board = GameBoard()
    //        let players = Players()
    //        let computer = AIController()
    //
    //        computer.selectACornerOrMiddleSquare(playerId: 1, ranNum: 1)
    //        XCTAssertTrue(board.isSquareStillInPlay(rowId: 0, columnId: 0))
    //
    //        computer.selectACornerOrMiddleSquare(playerId: 1, ranNum: 2)
    //        XCTAssertTrue(board.isSquareStillInPlay(rowId: 0, columnId: 2))
    //
    //        computer.selectACornerOrMiddleSquare(playerId: 1, ranNum: 3)
    //        XCTAssertTrue(board.isSquareStillInPlay(rowId: 2, columnId: 0))
    //
    //        computer.selectACornerOrMiddleSquare(playerId: 1, ranNum: 3)
    //        XCTAssertTrue(board.isSquareStillInPlay(rowId: 2, columnId: 2))
    //
    //        computer.selectACornerOrMiddleSquare(playerId: 1, ranNum: 0)
    //        XCTAssertTrue(board.isSquareStillInPlay(rowId: 0, columnId: 0))
    //
    //    }

}
