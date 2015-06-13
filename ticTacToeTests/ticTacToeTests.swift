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
        XCTAssertEqual(turnsLeft.numberOfTurnsLeftToPlay(), 8, "Should return 8")
        XCTAssertEqual(turnsLeft.numberOfTurnsLeftToPlay(), 7, "Should return 7")
        XCTAssertEqual(turnsLeft.numberOfTurnsLeftToPlay(), 6, "Should return 6")
        XCTAssertEqual(turnsLeft.numberOfTurnsLeftToPlay(), 5, "Should return 5")
        XCTAssertEqual(turnsLeft.numberOfTurnsLeftToPlay(), 4, "Should return 4")
        XCTAssertEqual(turnsLeft.numberOfTurnsLeftToPlay(), 3, "Should return 3")
        XCTAssertEqual(turnsLeft.numberOfTurnsLeftToPlay(), 2, "Should return 2")
        XCTAssertEqual(turnsLeft.numberOfTurnsLeftToPlay(), 1, "Should return 1")
        XCTAssertEqual(turnsLeft.numberOfTurnsLeftToPlay(), 0, "Should return 0")
        XCTAssertNotEqual(turnsLeft.numberOfTurnsLeftToPlay(), -1, "should not be lower then 0")
    }
    
    func testResetNumberOfTurnsLeftToPlay() {
        let turnsLeft = Players()
        XCTAssertEqual(turnsLeft.resetNumberOfTurnsLeftToPlay(), 9, "Should start with 9 turns")
        
        XCTAssertEqual(turnsLeft.numberOfTurnsLeftToPlay(), 8, "Should return 8")
        turnsLeft.numberOfTurnsLeftToPlay()
        turnsLeft.numberOfTurnsLeftToPlay()
        turnsLeft.numberOfTurnsLeftToPlay()
        turnsLeft.numberOfTurnsLeftToPlay()
        turnsLeft.numberOfTurnsLeftToPlay()
        XCTAssertEqual(turnsLeft.numberOfTurnsLeftToPlay(), 2, "Should return 2")
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
    
    func testHasSquareBeenSelectedDuringPlay() {
        let squareSelected = GameBoard()
        XCTAssert(squareSelected.hasSquareBeenSelectedDuringPlay(rowId: 0, columnId: 0) == false, "squareSelected test failed")
        XCTAssertFalse(squareSelected.hasSquareBeenSelectedDuringPlay(rowId: 1, columnId: 1), "squareSelected test failed")
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
        let computer = AIController()
        let board = GameBoard()
        let player = 1
        computer.cpuToPlay(playerId: player)
        let squareSelected = board.gameSquares[0][0]

        
//        XCTAssertEqual(squareSelected, player, "should be equal to player")
//        XCTAssertTrue(board.hasSquareBeenSelectedDuringPlay(rowId: 0, columnId: 0))
        
        
    }
    
    func testMiniMax() {
        let ai = AIController()
        XCTAssertTrue(ai.miniMax())
    }
}

