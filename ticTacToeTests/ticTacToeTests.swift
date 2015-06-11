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
        //        XCTAssert(threeInARowVertical.vertical() == false )
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
