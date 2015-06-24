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
        
        board.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 0)
        board.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 1)
        board.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 8)
        XCTAssertEqual(board.squaresLeftInGame(), 6)
        
        XCTAssertEqual(board.gameSquares[0], 1)
        XCTAssertEqual(board.gameSquares[1], 2)
        XCTAssertEqual(board.gameSquares[8], 1)
    }
    
    func testSquaresSelectedDuringPlay() {
        let board = GameBoard()
        
        board.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 0)
        XCTAssertEqual(board.squaresSelectedDuringPlay[0], 0)
        
        board.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 3)
        XCTAssertEqual(board.squaresSelectedDuringPlay[1], 3)
        
        board.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 8)
        XCTAssertEqual(board.squaresSelectedDuringPlay[2], 8)
    }
    
    func testNumberOfTurnsLeftToPlay() {
        let turnsLeft = GameBoard()
        
        XCTAssertEqual(turnsLeft.resetNumberOfSquaresLeftToPlay(), 9, "Should start with 9 turns")
        XCTAssertEqual(turnsLeft.reduceNumberOfSquaresLeftToPlayByOne(), 8, "Should return 8")
        XCTAssertEqual(turnsLeft.reduceNumberOfSquaresLeftToPlayByOne(), 7, "Should return 7")
        XCTAssertEqual(turnsLeft.reduceNumberOfSquaresLeftToPlayByOne(), 6, "Should return 6")
        XCTAssertEqual(turnsLeft.reduceNumberOfSquaresLeftToPlayByOne(), 5, "Should return 5")
        XCTAssertEqual(turnsLeft.reduceNumberOfSquaresLeftToPlayByOne(), 4, "Should return 4")
        XCTAssertEqual(turnsLeft.reduceNumberOfSquaresLeftToPlayByOne(), 3, "Should return 3")
        XCTAssertEqual(turnsLeft.reduceNumberOfSquaresLeftToPlayByOne(), 2, "Should return 2")
        XCTAssertEqual(turnsLeft.reduceNumberOfSquaresLeftToPlayByOne(), 1, "Should return 1")
        XCTAssertEqual(turnsLeft.reduceNumberOfSquaresLeftToPlayByOne(), 0, "Should return 0")
        XCTAssertNotEqual(turnsLeft.reduceNumberOfSquaresLeftToPlayByOne(), -1, "should not be lower then 0")
    }
    
    func testResetNumberOfTurnsLeftToPlay() {
        let turnsLeft =  GameBoard()
        
        XCTAssertEqual(turnsLeft.resetNumberOfSquaresLeftToPlay(), 9, "Should start with 9 turns")
        XCTAssertEqual(turnsLeft.reduceNumberOfSquaresLeftToPlayByOne(), 8, "Should return 8")
        
        turnsLeft.reduceNumberOfSquaresLeftToPlayByOne()
        turnsLeft.reduceNumberOfSquaresLeftToPlayByOne()
        turnsLeft.reduceNumberOfSquaresLeftToPlayByOne()
        turnsLeft.reduceNumberOfSquaresLeftToPlayByOne()
        turnsLeft.reduceNumberOfSquaresLeftToPlayByOne()
        
        XCTAssertEqual(turnsLeft.reduceNumberOfSquaresLeftToPlayByOne(), 2, "Should return 2")
        XCTAssertEqual(turnsLeft.resetNumberOfSquaresLeftToPlay(), 9, "Should start with 9 turns")
    }
    
    func testIncreaseNumberOfSquaresLeftToPlayByOne() {
        let turnsLeft =  GameBoard()
        
        XCTAssertEqual(turnsLeft.resetNumberOfSquaresLeftToPlay(), 9, "Should start with 9 turns")
        XCTAssertEqual(turnsLeft.reduceNumberOfSquaresLeftToPlayByOne(), 8, "Should return 8")
        
        turnsLeft.reduceNumberOfSquaresLeftToPlayByOne()//7
        
        XCTAssertEqual(turnsLeft.reduceNumberOfSquaresLeftToPlayByOne(), 6, "Should return 6")
        XCTAssertEqual(turnsLeft.increaseNumberOfSquaresLeftToPlayByOne(), 7, "Should start with 7 turns")
        XCTAssertEqual(turnsLeft.increaseNumberOfSquaresLeftToPlayByOne(), 8, "Should start with 8 turns")
    }
    
    func testResetBoard() {
        let reset = GameBoard()
        reset.resetBoard()
        var i = reset.gameSquares[0]
        var j = reset.gameSquares[2]
        var k = reset.gameSquares[3]
        
        XCTAssert(i == 0)
        XCTAssert(j == 0)
        XCTAssert(k == 0)
        
    }
    
    func testIsSquareStillInPlay() {
        let squareSelected = GameBoard()
        
        XCTAssertTrue(squareSelected.isSquareStillInPlay(squareId: 0), "squareSelected test failed")
        
        squareSelected.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 0)
        
        XCTAssertFalse(squareSelected.isSquareStillInPlay(squareId: 0), "squareSelected test failed")
    }

}
