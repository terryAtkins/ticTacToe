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
        
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 0)
        XCTAssertFalse(threeInARowVertical.thereIsThreeInARow_Vertical())
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0)
        XCTAssertTrue(threeInARowVertical.thereIsThreeInARow_Vertical())
        
        threeInARowVertical.resetBoard()
        XCTAssertFalse(threeInARowVertical.thereIsThreeInARow_Vertical())
        
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 2)
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 2)
        XCTAssertFalse(threeInARowVertical.thereIsThreeInARow_Vertical())
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 2)
        XCTAssertTrue(threeInARowVertical.thereIsThreeInARow_Vertical())
        
        threeInARowVertical.resetBoard()
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 1)
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 1)
        XCTAssertFalse(threeInARowVertical.thereIsThreeInARow_Vertical())
        threeInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 1)
        XCTAssertTrue(threeInARowVertical.thereIsThreeInARow_Vertical())
        
        threeInARowVertical.resetBoard()
        XCTAssertFalse(threeInARowVertical.thereIsThreeInARow_Vertical())
        
    }
    
    func testIsThereThreeInARow_Diagonal() {
        let threeInARowDiagonal = ThreeInARow()
        
        XCTAssertFalse(threeInARowDiagonal.thereIsThreeInARow_Diagonal())
        
        threeInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        threeInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        XCTAssertFalse(threeInARowDiagonal.checkForThreeInARow())
        threeInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 2)
        XCTAssertTrue(threeInARowDiagonal.thereIsThreeInARow_Diagonal())
        
        threeInARowDiagonal.resetBoard()
        XCTAssertFalse(threeInARowDiagonal.thereIsThreeInARow_Vertical())
        
        threeInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 2)
        threeInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 1)
        XCTAssertFalse(threeInARowDiagonal.checkForThreeInARow())
        threeInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 0)
        XCTAssertTrue(threeInARowDiagonal.thereIsThreeInARow_Diagonal())
        
        threeInARowDiagonal.resetBoard()
        XCTAssertFalse(threeInARowDiagonal.thereIsThreeInARow_Diagonal())
    }
    
    func testIsThereThreeInARow_Horizontal() {
        let threeInARowHorizontal = ThreeInARow()
        
        XCTAssertFalse(threeInARowHorizontal.thereIsThreeInARow_Horizontal())
        
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 1)
        XCTAssertFalse(threeInARowHorizontal.checkForThreeInARow())
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 2)
        XCTAssertTrue(threeInARowHorizontal.thereIsThreeInARow_Horizontal())
        
        threeInARowHorizontal.resetBoard()
        XCTAssertFalse(threeInARowHorizontal.thereIsThreeInARow_Horizontal())
        
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 0)
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        XCTAssertFalse(threeInARowHorizontal.checkForThreeInARow())
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 2)
        XCTAssertTrue(threeInARowHorizontal.thereIsThreeInARow_Horizontal())
        
        threeInARowHorizontal.resetBoard()
        XCTAssertFalse(threeInARowHorizontal.thereIsThreeInARow_Horizontal())
        
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0)
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 1)
        XCTAssertFalse(threeInARowHorizontal.checkForThreeInARow())
        threeInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 2)
        XCTAssertTrue(threeInARowHorizontal.thereIsThreeInARow_Horizontal())
        
        threeInARowHorizontal.resetBoard()
        XCTAssertFalse(threeInARowHorizontal.thereIsThreeInARow_Horizontal())
    }
    
    func testCheckForThreeInARow() {
        let check = ThreeInARow()
        
        XCTAssertFalse(check.checkForThreeInARow())
        
        check.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        check.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        XCTAssertFalse(check.checkForThreeInARow())
        check.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 2)
        XCTAssertTrue(check.checkForThreeInARow())
        
        check.resetBoard()
        check.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        check.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 1)
        XCTAssertFalse(check.checkForThreeInARow())
        check.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 2)
        XCTAssertTrue(check.checkForThreeInARow())
        
        check.resetBoard()
        check.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 1)
        check.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        XCTAssertFalse(check.checkForThreeInARow())
        check.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 1)
        XCTAssertTrue(check.checkForThreeInARow())
        
        check.resetBoard()
        XCTAssertFalse(check.thereIsThreeInARow_Diagonal())
    }

}
