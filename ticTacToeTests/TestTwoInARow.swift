//
//  TestTwoInARow.swift
//  ticTacToe
//
//  Created by terry atkins on 14/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit
import XCTest
import ticTacToe

class TestTwoInARow: XCTestCase {

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

}
