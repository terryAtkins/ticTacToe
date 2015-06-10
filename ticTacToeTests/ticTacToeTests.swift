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
    
    func testGameBoard(){
        let testBraod = GameBroad()
        testBraod.gameBroadSquares()
        //        XCTAssert(testBraod.setGameForFirstPlay().count == 9)
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
    
    func testThreeInARowHorizontal() {
        let threeInARow = GameBroad()
        XCTAssert(threeInARow.hasPlayerSelectedThreeInARowHorizontal() == true )
//        XCTAssert(threeInARow.hasPlayerSelectedThreeInARowHorizontal() == false )

        
        
    }
    
    //    func testPerformanceExample() {
    //        // This is an example of a performance test case.
    //        self.measureBlock() {
    //            // Put the code you want to measure the time of here.
    //        }
    //    }
    
}
