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
        
        XCTAssertTrue(computer.isSquareStillInPlay(squareId: 4))
        
        computer.isMiddleSquareFree_playIt(playerId:1 )
        
        XCTAssertFalse(computer.isSquareStillInPlay(squareId: 4))
    }
    
    func testChooseAnySquareExceptACorner() {
        let square = AIController()
        
        // Top row
        square.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 0)
        square.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 2)
        XCTAssertTrue(square.chooseAnySquareExceptACorner(playerId: 1))
        XCTAssertEqual(square.gameSquares[1], 1)
        
        // middle row
        square.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 4)
        XCTAssertTrue(square.chooseAnySquareExceptACorner(playerId: 1))
        XCTAssertEqual(square.gameSquares[3], 1)
        XCTAssertTrue(square.chooseAnySquareExceptACorner(playerId: 1))
        XCTAssertEqual(square.gameSquares[5], 1)
        
        // bottom row
        square.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 6)
        square.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 8)
        XCTAssertTrue(square.chooseAnySquareExceptACorner(playerId: 1))
        XCTAssertEqual(square.gameSquares[7], 1)
    }
    
    func testAWinningMove() {
        let winner = AIController()

        winner.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 0)
        winner.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 3)
        XCTAssertTrue(winner.winningMove(playerId: 1, squareId: 6))
        XCTAssertEqual(winner.gameSquares[6], 0, "function should reset square back to 0 after checking for a win")
        
        winner.resetBoard()
        winner.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 3)
        winner.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 5)
        XCTAssertTrue(winner.winningMove(playerId: 2, squareId: 4))
        XCTAssertEqual(winner.gameSquares[4], 0, "function should reset square back to 0 after checking for a win")
        
        winner.resetBoard()
        winner.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 0)
        winner.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 4)
        XCTAssertFalse(winner.winningMove(playerId: 2, squareId: 8))
        XCTAssertEqual(winner.gameSquares[8], 0, "function should reset square back to 0 after checking for a win")
    }
    
    func testABlockingMove () {
        let block = AIController()
        
        block.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 0)
        block.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 2)
        XCTAssertTrue(block.aBlockingMove(playerId: 1, squareId: 1))
        XCTAssertEqual(block.gameSquares[1], 0, "function should reset square back to 0 after checking for a block")
        
        block.resetBoard()
        block.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 0)
        block.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 8)
        XCTAssertTrue(block.aBlockingMove(playerId: 2, squareId: 4))
        XCTAssertEqual(block.gameSquares[4], 0, "function should reset square back to 0 after checking for a block")
        
        block.resetBoard()
        block.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 6)
        block.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 7)
        XCTAssertTrue(block.aBlockingMove(playerId: 2, squareId: 8))
        XCTAssertEqual(block.gameSquares[8], 0, "function should reset square back to 0 after checking for a block")
    }
    
    func testMiniMaxForWinOrBlock() {
        let computer = AIController()
        
        //  set up board for win 1
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 0) // topLeft
        computer.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 1) // topMiddle
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 3) // leftMiddle
        computer.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 2) // topRight
      
        computer.playForWinOrBlock(playerId: 1)
        XCTAssertEqual(computer.gameSquares[6], 1)
        XCTAssertFalse(computer.isSquareStillInPlay(squareId: 6), "AI sould select bottomLeft")

        //  set up board for win 2
        computer.resetBoard()
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 6) // bottomLeft
        computer.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 3) // leftMiddle
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 4) // middle
        computer.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 0) // topLeft
        XCTAssertEqual(computer.squaresLeftInGame(), 5)
        
        computer.playForWinOrBlock(playerId: 1)
        XCTAssertEqual(computer.gameSquares[2], 1)
        XCTAssertFalse(computer.isSquareStillInPlay(squareId: 2), "AI sould select topRight")
        
        
        // >>> setup board for block 1
        computer.resetBoard()
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 6) // bottomLeft
        computer.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 3) // leftMiddle
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 1) // topMiddle
        computer.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 4) // center
        
        computer.playForWinOrBlock(playerId: 1)
        XCTAssertEqual(computer.gameSquares[5], 1)
        XCTAssertFalse(computer.isSquareStillInPlay(squareId: 5), "AI sould select middleRight")
        
        // >>> setup board for block 2
        computer.resetBoard()
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 0) // topLeft
        computer.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 3) // leftMiddle
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 1) // middleTop
        computer.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 6) // bottomLeft
        
        computer.playForWinOrBlock(playerId: 2)
        XCTAssertEqual(computer.gameSquares[2], 2)
        XCTAssertFalse(computer.isSquareStillInPlay(squareId: 2), "AI sould select topRight")
        
        // >>> block or win, win should take place 
        computer.resetBoard()
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 6) // bottomLeft
        computer.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 0) // topLeft
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 7) // bottomMiddle
        computer.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 4) // center
        
        computer.playForWinOrBlock(playerId: 2)
        XCTAssertEqual(computer.gameSquares[8], 2)
        XCTAssertFalse(computer.isSquareStillInPlay(squareId: 8), "AI sould select bottomRight to win")
    }
    
    func testSearchForEmptySquares() {
        let computer = AIController()
        let board = computer.gameSquares
        
        
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 1)
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 2)
        
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 4)
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 5)
       
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 6)
        computer.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 8)
        
       
        var numberOfeEmptySquares = computer.searchForEmptySquares()
        var secondSquare = computer.searchForEmptySquares()
        var thirdSquare = computer.searchForEmptySquares()

        XCTAssertEqual(numberOfeEmptySquares.count, 3)
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

















