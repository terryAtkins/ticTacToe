//
//  ticTacToeTests.swift
//  ticTacToeTests
//
//  Created by terry atkins on 09/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit
import XCTest
import ticTacToe


class ticTacToeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
    
    func testUpdateGameBoard() {
        let board = GameBoard()
        board.updateGameBoardWhenSquareSelected(playerId: 1,rowId: 0,columnId: 0)
        board.updateGameBoardWhenSquareSelected(playerId: 2,rowId: 1,columnId: 1)
        board.updateGameBoardWhenSquareSelected(playerId: 1,rowId: 2,columnId: 2)
        XCTAssertEqual(board.gameSquares[0][0], 1)
        XCTAssertEqual(board.gameSquares[1][1], 2)
        XCTAssertEqual(board.gameSquares[2][2], 1)
    }
    
    func testHumanVsHuman() {
        
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
    
    func testIsSquareStillInPlay() {
        let squareSelected = GameBoard()
        XCTAssertTrue(squareSelected.isSquareStillInPlay(rowId: 0, columnId: 0), "squareSelected test failed")
        squareSelected.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        XCTAssertFalse(squareSelected.isSquareStillInPlay(rowId: 0, columnId: 0), "squareSelected test failed")
    }
    
    func testThreeInARowHorizontal() {
        let threeInARowHorizontal = GameBoard()
        XCTAssert(threeInARowHorizontal.horizontal() == true )
        //        XCTAssert(threeInARowHorizontal.horizontal() == false )
        
    }
    
    
    func testThreeInARowVertical() {
        let threeInARowVertical = GameBoard()
        XCTAssert(threeInARowVertical.vertical() == true )
//                XCTAssert(threeInARowVertical.vertical() == false )
    }
    
    func testThreeInARowDiagonal() {
        let threeInARowDiagonal = GameBoard()
        XCTAssert(threeInARowDiagonal.diagonal() == true)
        //        XCTAssert(threeInARowDiagonal.diagonal() == false)
    }
    
    func testThreeInARowReset() {
        let threeReset = GameBoard()
        threeReset.resetBoard()
        var i = threeReset.gameSquares[0][2]
        var j = threeReset.gameSquares[1][0]
        var k = threeReset.gameSquares[2][1]
        
        XCTAssert(i == 0)
        XCTAssert(j == 0)
        XCTAssert(k == 0)
    }
    func testCheckForThreeInARowToWin() {
        let check = GameBoard()
        XCTAssertTrue(check.checkForThreeInARowToWin())
    }
    
    func testAIController() {

        let board = GameBoard()
        let players = Players()
        let computer = AIController()
    
        computer.selectACornerSquare(playerId: 1, ranNum: 1)
        XCTAssertTrue(board.isSquareStillInPlay(rowId: 0, columnId: 0))
        
        computer.selectACornerSquare(playerId: 1, ranNum: 2)
        XCTAssertTrue(board.isSquareStillInPlay(rowId: 0, columnId: 2))

        computer.selectACornerSquare(playerId: 1, ranNum: 3)
        XCTAssertTrue(board.isSquareStillInPlay(rowId: 2, columnId: 0))
        
        computer.selectACornerSquare(playerId: 1, ranNum: 3)
        XCTAssertTrue(board.isSquareStillInPlay(rowId: 2, columnId: 2))
        
        computer.selectACornerSquare(playerId: 1, ranNum: 0)
        XCTAssertTrue(board.isSquareStillInPlay(rowId: 0, columnId: 0))

    }
}

