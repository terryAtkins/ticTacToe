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
    
    func testComputerHasTakenATurn() {
        let turnTaken = AIController()
        
        XCTAssertEqual(turnTaken.squaresLeftInGame(), 9, "should be 9 plays left")
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 1), "checking computer takes first turn")
        XCTAssertEqual(turnTaken.reduceNumberOfSquaresLeftToPlayByOne(), 7, "Other players takes a turn")
        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 1), "checking computer plays next")
        XCTAssertEqual(turnTaken.reduceNumberOfSquaresLeftToPlayByOne(), 5, "Other players takes a turn")
        
        // >>>>>>>>>>>> issue with mimiMax
//        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 1), "checking computer takes first turn")
//        XCTAssertEqual(turnTaken.reduceNumberOfSquaresLeftToPlayByOne(), 3, "Other players takes a turn")
//        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 1), "checking computer plays next")
//        XCTAssertEqual(turnTaken.reduceNumberOfSquaresLeftToPlayByOne(), 1, "Other players takes a turn")
//        XCTAssertTrue(turnTaken.computersTurnToPlay(playerId: 1), "checking computer takes first turn")
//        
//        // shouldn't play game over
//        XCTAssertFalse(turnTaken.computersTurnToPlay(playerId: 1), "checking computer takes first turn")

    }

    func testSelectACornerOrMiddleSquare() {
        
        let computer = AIController()

        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 1))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 2))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 2))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 1))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 2))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 1))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 2))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 2))
        XCTAssertTrue(computer.selectACornerOrMiddleSquare(playerId: 1))
        
    }

    func testPlayTheMiddleSquareOrFindACornerToPlay() {
        let computer = AIController()
        
        XCTAssertTrue(computer.isSquareStillInPlay(rowId: 1, columnId: 1))
        computer.playTheMiddleSquareOrFindACornerToPlay(playerId: 1)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 1, columnId: 1))
        
        XCTAssertTrue(computer.isSquareStillInPlay(rowId: 0, columnId: 0))
        computer.playTheMiddleSquareOrFindACornerToPlay(playerId: 2)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 0, columnId: 0))
        
        XCTAssertTrue(computer.isSquareStillInPlay(rowId: 0, columnId: 2))
        computer.playTheMiddleSquareOrFindACornerToPlay(playerId: 1)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 0, columnId: 2))
        
        XCTAssertTrue(computer.isSquareStillInPlay(rowId: 2, columnId: 0))
        computer.playTheMiddleSquareOrFindACornerToPlay(playerId: 2)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 2, columnId: 0))
        
        XCTAssertTrue(computer.isSquareStillInPlay(rowId: 2, columnId: 2))
        computer.playTheMiddleSquareOrFindACornerToPlay(playerId: 1)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 2, columnId: 2))
        
    }
    
    func testMiniMaxForWinOrBlock() {
        var computer = AIController()
        
        //  set up board for win 1
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0) // topLeft
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 1) // topMiddle
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 0) // leftMiddle
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 2) // topRight
      
        computer.miniMax(playerId: 1)
        XCTAssertEqual(computer.gameSquares[2][0], 1)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 2, columnId: 0), "AI sould select bottomLeft")

        //  set up board for win 2
        computer.resetBoard()
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0) // bottomLeft
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 0) // leftMiddle
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1) // middle
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 2) // topRight
        
        computer.miniMax(playerId: 1)
        XCTAssertEqual(computer.gameSquares[0][2], 1)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 0, columnId: 2), "AI sould select topRight")
        
        
        // >>> setup board for block 1
        computer.resetBoard()
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0) // bottomLeft
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 0) // leftMiddle
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 1) // middleTop
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 1) // topRight
        
        computer.miniMax(playerId: 1)
        XCTAssertEqual(computer.gameSquares[0][2], 1)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 0, columnId: 2), "AI sould select topRight")
        
        // >>> setup board for block 2
        computer.resetBoard()
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0) // topLeft
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 0) // leftMiddle
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 1) // middleTop
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 2) // bottomLeft
        
        computer.miniMax(playerId: 2)
        XCTAssertEqual(computer.gameSquares[0][2], 2)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 0, columnId: 2), "AI sould select topRight")
        
        // >>> block or win, win should take place 
        computer.resetBoard()
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0) // bottomLeft
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 0) // topLeft
        computer.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 1) // bottomMiddle
        computer.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 1) // middle
        
        computer.miniMax(playerId: 2)
        XCTAssertEqual(computer.gameSquares[2][2], 2)
        XCTAssertFalse(computer.isSquareStillInPlay(rowId: 2, columnId: 2), "AI sould select bottomRight to win")
        

}
    func testSearchForEmptySquares() {
        let computer = AIController()
        var board = computer.gameSquares
        
        
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


}

















