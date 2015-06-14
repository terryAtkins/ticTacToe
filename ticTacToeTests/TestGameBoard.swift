//
//  TestGameBoard.swift
//  ticTacToe
//
//  Created by terry atkins on 14/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit
import XCTest
import ticTacToe

class TestGameBoard: XCTestCase {

    func testUpdateGameBoard() {
        let board = GameBoard()
        board.updateGameBoardWhenSquareSelected(playerId: 1,rowId: 0,columnId: 0)
        board.updateGameBoardWhenSquareSelected(playerId: 2,rowId: 1,columnId: 1)
        board.updateGameBoardWhenSquareSelected(playerId: 1,rowId: 2,columnId: 2)
        XCTAssertEqual(board.gameSquares[0][0], 1)
        XCTAssertEqual(board.gameSquares[1][1], 2)
        XCTAssertEqual(board.gameSquares[2][2], 1)
    }
    
    func testResetBoard() {
        let reset = GameBoard()
        reset.resetBoard()
        var i = reset.gameSquares[0][0]
        var j = reset.gameSquares[0][2]
        var k = reset.gameSquares[1][0]
        
        XCTAssert(i == 0)
        XCTAssert(j == 0)
        XCTAssert(k == 0)
        
    }
    
    func testIsSquareStillInPlay() {
        let squareSelected = GameBoard()
        XCTAssertTrue(squareSelected.isSquareStillInPlay(rowId: 0, columnId: 0), "squareSelected test failed")
        squareSelected.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        XCTAssertFalse(squareSelected.isSquareStillInPlay(rowId: 0, columnId: 0), "squareSelected test failed")
    }

}
