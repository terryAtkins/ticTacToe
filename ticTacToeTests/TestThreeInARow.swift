//
//  TestThreeInARow.swift
//  ticTacToe
//
//  Created by terry atkins on 14/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit
import XCTest
import ticTacToe

class TestThreeInARow: XCTestCase {
    
    func testIsThereThreeInARowVertical() {
        var threeInARowVertical = ThreeInARow()
        
        XCTAssertFalse(threeInARowVertical.thereIsThreeInARow_Vertical())
        
        threeInARowVertical.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 0)
        threeInARowVertical.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 3)
        XCTAssertFalse(threeInARowVertical.thereIsThreeInARow_Vertical())
        threeInARowVertical.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 6)
        XCTAssertTrue(threeInARowVertical.thereIsThreeInARow_Vertical())
        
        threeInARowVertical.resetBoard()
        XCTAssertFalse(threeInARowVertical.thereIsThreeInARow_Vertical())
        
        threeInARowVertical.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 2)
        threeInARowVertical.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 5)
        XCTAssertFalse(threeInARowVertical.thereIsThreeInARow_Vertical())
        threeInARowVertical.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 8)
        XCTAssertTrue(threeInARowVertical.thereIsThreeInARow_Vertical())
        
        threeInARowVertical.resetBoard()
        threeInARowVertical.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 1)
        threeInARowVertical.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 4)
        XCTAssertFalse(threeInARowVertical.thereIsThreeInARow_Vertical())
        threeInARowVertical.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 7)
        XCTAssertTrue(threeInARowVertical.thereIsThreeInARow_Vertical())
        
        threeInARowVertical.resetBoard()
        XCTAssertFalse(threeInARowVertical.thereIsThreeInARow_Vertical())
        
    }
    
    func testIsThereThreeInARow_Diagonal() {
        let threeInARowDiagonal = ThreeInARow()
        
        XCTAssertFalse(threeInARowDiagonal.thereIsThreeInARow_Diagonal())
        
        threeInARowDiagonal.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 0)
        threeInARowDiagonal.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 4)
        XCTAssertFalse(threeInARowDiagonal.checkForThreeInARow())
        threeInARowDiagonal.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 8)
        XCTAssertTrue(threeInARowDiagonal.thereIsThreeInARow_Diagonal())
        
        threeInARowDiagonal.resetBoard()
        XCTAssertFalse(threeInARowDiagonal.thereIsThreeInARow_Vertical())
        
        threeInARowDiagonal.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 2)
        threeInARowDiagonal.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 4)
        XCTAssertFalse(threeInARowDiagonal.checkForThreeInARow())
        threeInARowDiagonal.updateGameBoardWithSelectedSquare(playerId: 2, squareId: 6)
        XCTAssertTrue(threeInARowDiagonal.thereIsThreeInARow_Diagonal())
        
        threeInARowDiagonal.resetBoard()
        XCTAssertFalse(threeInARowDiagonal.thereIsThreeInARow_Diagonal())
    }
    
    func testIsThereThreeInARow_Horizontal() {
        let threeInARowHorizontal = ThreeInARow()
        
        XCTAssertFalse(threeInARowHorizontal.thereIsThreeInARow_Horizontal())
        
        threeInARowHorizontal.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 0)
        threeInARowHorizontal.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 1)
        XCTAssertFalse(threeInARowHorizontal.checkForThreeInARow())
        threeInARowHorizontal.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 2)
        XCTAssertTrue(threeInARowHorizontal.thereIsThreeInARow_Horizontal())
        
        threeInARowHorizontal.resetBoard()
        XCTAssertFalse(threeInARowHorizontal.thereIsThreeInARow_Horizontal())
        
        threeInARowHorizontal.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 3)
        threeInARowHorizontal.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 4)
        XCTAssertFalse(threeInARowHorizontal.checkForThreeInARow())
        threeInARowHorizontal.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 5)
        XCTAssertTrue(threeInARowHorizontal.thereIsThreeInARow_Horizontal())
        
        threeInARowHorizontal.resetBoard()
        XCTAssertFalse(threeInARowHorizontal.thereIsThreeInARow_Horizontal())
        
        threeInARowHorizontal.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 6)
        threeInARowHorizontal.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 7)
        XCTAssertFalse(threeInARowHorizontal.checkForThreeInARow())
        threeInARowHorizontal.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 8)
        XCTAssertTrue(threeInARowHorizontal.thereIsThreeInARow_Horizontal())
        
        threeInARowHorizontal.resetBoard()
        XCTAssertFalse(threeInARowHorizontal.thereIsThreeInARow_Horizontal())
    }
    
    func testCheckForThreeInARow() {
        let check = ThreeInARow()
        
        XCTAssertFalse(check.checkForThreeInARow())
        
        check.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 0)
        check.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 1)
        XCTAssertFalse(check.checkForThreeInARow())
        check.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 2)
        XCTAssertTrue(check.checkForThreeInARow())
        
        check.resetBoard()
        check.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 0)
        check.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 3)
        XCTAssertFalse(check.checkForThreeInARow())
        check.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 6)
        XCTAssertTrue(check.checkForThreeInARow())
        
        check.resetBoard()
        check.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 2)
        check.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 4)
        XCTAssertFalse(check.checkForThreeInARow())
        check.updateGameBoardWithSelectedSquare(playerId: 1, squareId: 6)
        XCTAssertTrue(check.checkForThreeInARow())
        
        check.resetBoard()
        XCTAssertFalse(check.thereIsThreeInARow_Diagonal())
    }

}
