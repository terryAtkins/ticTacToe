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

}
