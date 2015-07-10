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
        
        board.updateGameBoardWithSelectedSquare(squareId: 0)
        XCTAssertEqual(board.gameSquares[0], 2)
 
        board.updateGameBoardWithSelectedSquare(squareId: 8)
        XCTAssertEqual(board.gameSquares[8], 1)
    }
    
    func testSquaresSelectedDuringPlay() {
        let board = GameBoard()
        
        board.updateGameBoardWithSelectedSquare(squareId: 0)
        XCTAssertEqual(board.squaresSelectedDuringPlay[0], 0)
        
        board.updateGameBoardWithSelectedSquare(squareId: 3)
        XCTAssertEqual(board.squaresSelectedDuringPlay[1], 3)
        
        board.updateGameBoardWithSelectedSquare(squareId: 8)
        XCTAssertEqual(board.squaresSelectedDuringPlay[2], 8)
    }
    
    func testResetBoard() {
        let reset = GameBoard()
        
        reset.gameSquares = [0,0,0,0,0,0,0,0,1]
        XCTAssertTrue(reset.gameSquares[8] == 1)
        
        reset.resetBoard()
        XCTAssertTrue(reset.gameSquares[8] == 0)
    }
    
    func testIsSquareStillInPlay() {
        let squareSelected = GameBoard()
        
        XCTAssertTrue(squareSelected.isSquareStillInPlay(squareId: 0))
        squareSelected.gameSquares = [1,0,0,0,0,0,0,0,1]
        XCTAssertFalse(squareSelected.isSquareStillInPlay(squareId: 0))
    }

    func testIsWin() {
        let check = GameBoard()
        
        var board = [0,0,0,0,0,0,0,0,0]
        XCTAssertFalse(check.isWin(gameBoard: board))
        
         // horizontal
        board = [1,1,1,0,0,0,0,0,0]
        XCTAssertTrue(check.isWin(gameBoard: board))
        
        // vertical
        board = [0,1,0,0,1,0,0,1,0]
        XCTAssertTrue(check.isWin(gameBoard: board))
        
        // diagonal
        board = [0,0,1,0,1,0,1,0,0]
        XCTAssertTrue(check.isWin(gameBoard: board))
    }
}
