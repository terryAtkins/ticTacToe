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
    
    func testIsThisTheFirstSquareOfTheGameSelected() {
        let firstPlay = AIController()
//        XCTAssertTrue(firstPlay.isThisTheFirstSquareOfTheGameSelected)
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
    
    func testIsThereTwoInARow_Horizontal() {
        let twoInARowHorizontal = TwoInARow()
        
        XCTAssertFalse(twoInARowHorizontal.isThereTwoInARow_Horizontal())
        
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 1)
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 2)
        XCTAssertTrue(twoInARowHorizontal.isThereTwoInARow_Horizontal())
        
        twoInARowHorizontal.resetBoard()
        XCTAssertFalse(twoInARowHorizontal.isThereTwoInARow_Horizontal())
        
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 0)
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 2)
        XCTAssertTrue(twoInARowHorizontal.isThereTwoInARow_Horizontal())
        
        twoInARowHorizontal.resetBoard()
        XCTAssertFalse(twoInARowHorizontal.isThereTwoInARow_Horizontal())
        
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0)
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 0, rowId: 2, columnId: 1)
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 2)
        XCTAssertFalse(twoInARowHorizontal.isThereTwoInARow_Horizontal())
        
    }

    func testisThereTwoInARow_Vertical() {
        let twoInARowVertical = TwoInARow()
        
        XCTAssertFalse(twoInARowVertical.isThereTwoInARow_Vertical())
        
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 0)
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 0)
        XCTAssertTrue(twoInARowVertical.isThereTwoInARow_Vertical())
        
        twoInARowVertical.resetBoard()
        XCTAssertFalse(twoInARowVertical.isThereTwoInARow_Vertical())
        
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 1)
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 1)
        XCTAssertTrue(twoInARowVertical.isThereTwoInARow_Vertical())
        
        twoInARowVertical.resetBoard()
        XCTAssertFalse(twoInARowVertical.isThereTwoInARow_Vertical())
        
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 0, rowId: 0, columnId: 2)
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 2)
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 2)
        XCTAssertFalse(twoInARowVertical.isThereTwoInARow_Vertical())
    }

    func testisThereTwoInARow_Diagonal() {
        let twoInARowDiagonal = TwoInARow()
            twoInARowDiagonal.resetBoard()
        XCTAssertFalse(twoInARowDiagonal.isThereTwoInARow_Diagonal())
        
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 2)
        XCTAssertTrue(twoInARowDiagonal.isThereTwoInARow_Diagonal())
        
        twoInARowDiagonal.resetBoard()
        XCTAssertFalse(twoInARowDiagonal.isThereTwoInARow_Diagonal())
        
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0)
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 1)
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 2)
        XCTAssertTrue(twoInARowDiagonal.isThereTwoInARow_Diagonal())
        
        twoInARowDiagonal.resetBoard()
        XCTAssertFalse(twoInARowDiagonal.isThereTwoInARow_Diagonal())
        
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 0, rowId: 0, columnId: 0)
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 0, rowId: 2, columnId: 2)
        XCTAssertFalse(twoInARowDiagonal.isThereTwoInARow_Diagonal())
    }
    
//    func testCheckForTwoInARowToBlock() {
//        let check = GameBoard()
//        XCTAssertTrue(check.checkForTwoInARowToBlock())
//    }
    
    func testIsThereThreeInARowVertical() {
        var threeInARowVertical = ThreeInARow()
       
        XCTAssertFalse(threeInARowVertical.isThereThreeInARow_Vertical())
        
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 0)
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0)
        XCTAssertTrue(threeInARowVertical.isThereThreeInARow_Vertical())
        
        threeInARowVertical.resetBoard()
        XCTAssertFalse(threeInARowVertical.isThereThreeInARow_Vertical())
        
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 2)
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 2)
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 2)
        XCTAssertTrue(threeInARowVertical.isThereThreeInARow_Vertical())
        
        threeInARowVertical.resetBoard()
        XCTAssertFalse(threeInARowVertical.isThereThreeInARow_Vertical())

    }
    
    func testIsThereThreeInARow_Diagonal() {
        let threeInARowDiagonal = ThreeInARow()
        XCTAssertFalse(threeInARowDiagonal.isThereThreeInARow_Diagonal())
        
        threeInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        threeInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        threeInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 2)
        XCTAssertTrue(threeInARowDiagonal.isThereThreeInARow_Diagonal())
        
        threeInARowDiagonal.resetBoard()
        XCTAssertFalse(threeInARowDiagonal.isThereThreeInARow_Diagonal())
        
        threeInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 2)
        threeInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 1)
        threeInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 0)
        XCTAssertTrue(threeInARowDiagonal.isThereThreeInARow_Diagonal())
        
        threeInARowDiagonal.resetBoard()
        XCTAssertFalse(threeInARowDiagonal.isThereThreeInARow_Diagonal())


        
    }
    
    func testIsThereThreeInARow_Horizontal() {
        var threeInARowHorizontal = ThreeInARow()
        
        XCTAssertFalse(threeInARowHorizontal.isThereThreeInARow_Horizontal())
        
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 1)
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 2)
        XCTAssertTrue(threeInARowHorizontal.isThereThreeInARow_Horizontal())
        
        threeInARowHorizontal.resetBoard()
        XCTAssertFalse(threeInARowHorizontal.isThereThreeInARow_Horizontal())
        
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 0)
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 2)
        XCTAssertTrue(threeInARowHorizontal.isThereThreeInARow_Horizontal())
        
        threeInARowHorizontal.resetBoard()
        XCTAssertFalse(threeInARowHorizontal.isThereThreeInARow_Horizontal())
        
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0)
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 1)
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 2)
        XCTAssertTrue(threeInARowHorizontal.isThereThreeInARow_Horizontal())
        
        threeInARowHorizontal.resetBoard()
        XCTAssertFalse(threeInARowHorizontal.isThereThreeInARow_Horizontal())
    }
    
    func testCheckForThreeInARowToWin() {
        let check = ThreeInARow()
        
        XCTAssertFalse(check.checkForThreeInARow_ToWin())
        
        check.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        check.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        check.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 2)
        XCTAssertTrue(check.checkForThreeInARow_ToWin())
        
        check.resetBoard()
        XCTAssertFalse(check.isThereThreeInARow_Diagonal())
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

