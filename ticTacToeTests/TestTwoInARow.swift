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
        
        XCTAssertFalse(twoInARowHorizontal.isThereMatchingPairs_Horizontal())
        
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 1)
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 2)
        XCTAssertTrue(twoInARowHorizontal.isThereMatchingPairs_Horizontal())
        
        twoInARowHorizontal.resetBoard()
        XCTAssertFalse(twoInARowHorizontal.isThereMatchingPairs_Horizontal())
        
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 0)
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 2)
        XCTAssertTrue(twoInARowHorizontal.isThereMatchingPairs_Horizontal())
        
        twoInARowHorizontal.resetBoard()
        XCTAssertFalse(twoInARowHorizontal.isThereMatchingPairs_Horizontal())
        
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0)
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 0, rowId: 2, columnId: 1)
        twoInARowHorizontal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 2)
        XCTAssertFalse(twoInARowHorizontal.isThereMatchingPairs_Horizontal())
        
    }
    
    func testisThereTwoInARow_Vertical() {
        let twoInARowVertical = TwoInARow()
        
        XCTAssertFalse(twoInARowVertical.isThereMatchingPairs_Vertical())
        
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 0)
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 0)
        XCTAssertTrue(twoInARowVertical.isThereMatchingPairs_Vertical())
        
        twoInARowVertical.resetBoard()
        XCTAssertFalse(twoInARowVertical.isThereMatchingPairs_Vertical())
        
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 1)
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 1)
        XCTAssertTrue(twoInARowVertical.isThereMatchingPairs_Vertical())
        
        twoInARowVertical.resetBoard()
        XCTAssertFalse(twoInARowVertical.isThereMatchingPairs_Vertical())
        
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 0, rowId: 0, columnId: 2)
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 2)
        twoInARowVertical.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 2)
        XCTAssertFalse(twoInARowVertical.isThereMatchingPairs_Vertical())
    }
    
    func testisThereTwoInARow_Diagonal() {
        let twoInARowDiagonal = TwoInARow()
        twoInARowDiagonal.resetBoard()
        XCTAssertFalse(twoInARowDiagonal.isThereMatchingPairs_Diagonal())
        
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 2, columnId: 2)
        XCTAssertTrue(twoInARowDiagonal.isThereMatchingPairs_Diagonal())
        
        twoInARowDiagonal.resetBoard()
        XCTAssertFalse(twoInARowDiagonal.isThereMatchingPairs_Diagonal())
        
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 2, columnId: 0)
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 1, columnId: 1)
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 2, rowId: 0, columnId: 2)
        XCTAssertTrue(twoInARowDiagonal.isThereMatchingPairs_Diagonal())
        
        twoInARowDiagonal.resetBoard()
        XCTAssertFalse(twoInARowDiagonal.isThereMatchingPairs_Diagonal())
        
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 0, rowId: 0, columnId: 0)
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 1, columnId: 1)
        twoInARowDiagonal.updateGameBoardWhenSquareSelected(playerId: 0, rowId: 2, columnId: 2)
        XCTAssertFalse(twoInARowDiagonal.isThereMatchingPairs_Diagonal())
    }
    
        func testCheckForTwoInARowToBlock() {
            let check = TwoInARow()
            
            XCTAssertFalse(check.checkForTwoInARow())
            
            check.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 0)
            check.updateGameBoardWhenSquareSelected(playerId: 1, rowId: 0, columnId: 2)
            
            XCTAssertTrue(check.checkForTwoInARow())
        }
//    func testPlayerHasForkBlock() {
//        let checkForBlock = TwoInARow()
//        
//            XCTAssertTrue(checkForBlock.playerHasForkBlock())
//    }


}
