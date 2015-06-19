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
    
    func testIsCornersFree_playOne() {
        
        let computer = AIController()

        XCTAssertTrue(computer.isCornersFree_playOne(playerId: 1))
        XCTAssertTrue(computer.isCornersFree_playOne(playerId: 2))
        XCTAssertTrue(computer.isCornersFree_playOne(playerId: 1))
        XCTAssertTrue(computer.isCornersFree_playOne(playerId: 2))
        XCTAssertFalse(computer.isCornersFree_playOne(playerId: 1))
    }

    func testIsMiddleSquareFree_playIt() {
        let computer = AIController()
        
        XCTAssertTrue(computer.isSquareStillInPlay(rowId: 1, columnId: 1))
        
        computer.isMiddleSquareFree_playIt(playerId:1 )
        
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 1, columnId: 1))
    }
    
    func testChooseAnySquareExceptACorner() {
        let square = AIController()
        
        // Top row
        square.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 0)
        square.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 2)
        XCTAssertTrue(square.chooseAnySquareExceptACorner(playerId: 1))
        XCTAssertEqual(square.gameSquares[0][1], 1)
        
        // middle row
        square.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 1)
        XCTAssertTrue(square.chooseAnySquareExceptACorner(playerId: 1))
        XCTAssertEqual(square.gameSquares[1][0], 1)
        XCTAssertTrue(square.chooseAnySquareExceptACorner(playerId: 1))
        XCTAssertEqual(square.gameSquares[1][2], 1)
        
        // middle row
        square.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 0)
        square.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 2)
        XCTAssertTrue(square.chooseAnySquareExceptACorner(playerId: 1))
        XCTAssertEqual(square.gameSquares[2][1], 1)
    }
    
    func testAWinningMove() {
        let winner = AIController()

        winner.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        winner.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 0)
        XCTAssertTrue(winner.winningMove(playerId: 1, rowId: 2, columnId: 0))
        XCTAssertEqual(winner.gameSquares[2][0], 0, "function should reset square back to 0 after checking for a win")
        
        winner.resetBoard()
        winner.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 0)
        winner.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 1)
        XCTAssertTrue(winner.winningMove(playerId: 2, rowId: 1, columnId: 2))
        XCTAssertEqual(winner.gameSquares[1][2], 0, "function should reset square back to 0 after checking for a win")
        
        winner.resetBoard()
        winner.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 0)
        winner.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 1)
        XCTAssertFalse(winner.winningMove(playerId: 2, rowId: 1, columnId: 2))
        XCTAssertEqual(winner.gameSquares[1][2], 0, "function should reset square back to 0 after checking for a win")
    }
    
    func testABlockingMove () {
        let block = AIController()
        
        block.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 0)
        block.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 2)
        XCTAssertTrue(block.aBlockingMove(playerId: 1, rowId: 0, columnId: 1))
        XCTAssertEqual(block.gameSquares[0][1], 0, "function should reset square back to 0 after checking for a block")
        
        block.resetBoard()
        block.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        block.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 2)
        XCTAssertTrue(block.aBlockingMove(playerId: 2, rowId: 1, columnId: 1))
        XCTAssertEqual(block.gameSquares[1][1], 0, "function should reset square back to 0 after checking for a block")
        
        block.resetBoard()
        block.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0)
        block.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 1)
        XCTAssertTrue(block.aBlockingMove(playerId: 2, rowId: 2, columnId: 2))
        XCTAssertEqual(block.gameSquares[2][2], 0, "function should reset square back to 0 after checking for a block")
    }
    
    func testMiniMaxForWinOrBlock() {
        let computer = AIController()
        
        //  set up board for win 1
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0) // topLeft
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 1) // topMiddle
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 0) // leftMiddle
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 2) // topRight
      
        computer.isWinDrawOrBlock(playerId: 1)
        XCTAssertEqual(computer.gameSquares[2][0], 1)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 2, columnId: 0), "AI sould select bottomLeft")

        //  set up board for win 2
        computer.resetBoard()
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0) // bottomLeft
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 0) // leftMiddle
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1) // middle
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 2) // topRight
        
        computer.isWinDrawOrBlock(playerId: 1)
        XCTAssertEqual(computer.gameSquares[0][2], 1)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 0, columnId: 2), "AI sould select topRight")
        
        
        // >>> setup board for block 1
        computer.resetBoard()
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0) // bottomLeft
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 0) // leftMiddle
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 1) // topMiddle
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 1) // center
        
        computer.isWinDrawOrBlock(playerId: 1)
        XCTAssertEqual(computer.gameSquares[1][2], 1)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 1, columnId: 2), "AI sould select topRight")
        
        // >>> setup board for block 2
        computer.resetBoard()
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0) // topLeft
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 0) // leftMiddle
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 1) // middleTop
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 2) // bottomLeft
        
        computer.isWinDrawOrBlock(playerId: 2)
        XCTAssertEqual(computer.gameSquares[0][2], 2)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 0, columnId: 2), "AI sould select topRight")
        
        // >>> block or win, win should take place 
        computer.resetBoard()
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0) // bottomLeft
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 0) // topLeft
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 1) // bottomMiddle
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 1) // middle
        
        computer.isWinDrawOrBlock(playerId: 2)
        XCTAssertEqual(computer.gameSquares[2][2], 2)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 2, columnId: 2), "AI sould select bottomRight to win")
    }
    
    func testSearchForEmptySquares() {
        let computer = AIController()
        let board = computer.gameSquares
        
        
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 1)
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 2)
        
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 0)
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
       
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0)
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 2)
        
       
        var firstSquare = computer.searchForEmptySquares()[0]
        var secondSquare = computer.searchForEmptySquares()[1]
        var thirdSquare = computer.searchForEmptySquares()[2]

        XCTAssertEqual(firstSquare, [0,0])
        XCTAssertEqual(secondSquare, [1,2])
        XCTAssertEqual(thirdSquare, [2,1])
    }
 
    func testSwitchPlayer() {
        var players  = AIController()
        var player1 = 1
        var player2 = 2
        
        XCTAssertEqual(players.switchPlayersId(playerId: player1), 2, "should switch to 2")
        XCTAssertEqual(players.switchPlayersId(playerId: player2), 1, "should switch to 1")
    }
  
    func testComputerHasTakenATurn() {
        let turnTaken = AIController()
        
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 1), "checking computer plays next")
        XCTAssertEqual(turnTaken.squaresLeftInGame(), 8, "should be 8 plays left")
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 2), "checking computer plays next")
        XCTAssertEqual(turnTaken.squaresLeftInGame(), 7, "should be 7 plays left")
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 1), "checking computer plays next")
        XCTAssertEqual(turnTaken.squaresLeftInGame(), 6, "should be 6 plays left")
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 2), "checking computer plays next")
        XCTAssertEqual(turnTaken.squaresLeftInGame(), 5, "should be 5 plays left")
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 1), "checking computer plays next")
        XCTAssertEqual(turnTaken.squaresLeftInGame(), 4, "should be 4 plays left")
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 2), "checking computer plays next")
        XCTAssertEqual(turnTaken.squaresLeftInGame(), 3, "should be 3 plays left")
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 1), "checking computer plays next")
        XCTAssertEqual(turnTaken.squaresLeftInGame(), 2, "should be 2 plays left")
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 2), "checking computer plays next")
        XCTAssertEqual(turnTaken.squaresLeftInGame(), 1, "should be 1 plays left")
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 1), "checking computer plays next")
        XCTAssertEqual(turnTaken.squaresLeftInGame(), 0, "should be 0 plays left")
        
        XCTAssertFalse(turnTaken.checkForThreeInARow(), "Should be a win")
        
        XCTAssertFalse(turnTaken.computersTurnToPlay(playerId: 2), "should be game over")
    }

}

















