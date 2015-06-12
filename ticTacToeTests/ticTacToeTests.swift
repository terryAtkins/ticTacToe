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
        XCTAssertTrue(turnsLeft.numberOfTurnsLeftToPlay())
        XCTAssertTrue(turnsLeft.numberOfTurnsLeftToPlay())
        XCTAssertTrue(turnsLeft.numberOfTurnsLeftToPlay())
        XCTAssertTrue(turnsLeft.numberOfTurnsLeftToPlay())
        XCTAssertTrue(turnsLeft.numberOfTurnsLeftToPlay())
        XCTAssertTrue(turnsLeft.numberOfTurnsLeftToPlay())
        XCTAssertTrue(turnsLeft.numberOfTurnsLeftToPlay())
        XCTAssertTrue(turnsLeft.numberOfTurnsLeftToPlay())
        XCTAssertTrue(turnsLeft.numberOfTurnsLeftToPlay())

        XCTAssertFalse(turnsLeft.numberOfTurnsLeftToPlay())
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
        let frstSquare = board.gameSquares[0][0]
        let secondSquare = board.gameSquares[1][1]
        let thridSquare = board.gameSquares[2][2]
        XCTAssert(frstSquare == 1)
        XCTAssert(secondSquare == 2)
        XCTAssert(thridSquare == 1)
    }
    
    func testHumanVsHuman() {
        
    }
    
    func testGameMethod () {
        let gameType = Players()
        XCTAssert(gameType.gameMethod(1) == gameType.gameMethod.humanVsHuman)
        
    }
    
    func testWhichPlayerGoesFirst() {
        let firstPlayer = Players()
        XCTAssert(firstPlayer.chooseWhoGoesFirst(1) == 1)
        XCTAssert(firstPlayer.chooseWhoGoesFirst(2) == 2)
        XCTAssert(firstPlayer.chooseWhoGoesFirst(0) == 2)
    }
    
    func testPlayersTakeTurns() {
        let player = Players()
        XCTAssert(player.playerToPlayNext(1) == 2 )
        XCTAssert(player.playerToPlayNext(2) == 1 )
        
    }
    
    func testHasSquareBeenSelectedDuringPlay() {
        let squareSelected = GameBoard()
        XCTAssert(squareSelected.hasSquareBeenSelectedDuringPlay(0) == false, "squareSelected test failed")
        XCTAssert(squareSelected.hasSquareBeenSelectedDuringPlay(1) == true, "squareSelected test failed")
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

    
}

