//
//  TestGameController.swift
//  ticTacToe
//
//  Created by terry atkins on 20/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit
import XCTest
import ticTacToe

class TestGameController: XCTestCase {


    func testMachineVsMachine() {
        let cpu = GameController()

        cpu.machineVsMachine()

        XCTAssertFalse(cpu.isSquareStillInPlay(squareId: 0))
        XCTAssertFalse(cpu.isSquareStillInPlay(squareId: 1))
        XCTAssertFalse(cpu.isSquareStillInPlay(squareId: 2))
        XCTAssertFalse(cpu.isSquareStillInPlay(squareId: 3))
        XCTAssertFalse(cpu.isSquareStillInPlay(squareId: 4))
        XCTAssertFalse(cpu.isSquareStillInPlay(squareId: 5))
        XCTAssertFalse(cpu.isSquareStillInPlay(squareId: 6))
        XCTAssertFalse(cpu.isSquareStillInPlay(squareId: 7))
        XCTAssertFalse(cpu.isSquareStillInPlay(squareId: 8))
        
        XCTAssertEqual(cpu.squaresLeftInGame(), 0)
        
        XCTAssertEqual(cpu.gameSquares[4], 2, "cpuO should have selected the center square on first go")
    }
    
    func testHumanVsMachine() {
        let cpu = GameController()
//        typealias  player = GameController.PlayerGoingFirst
        
//        cpu.whichPlayerGoesFirstHumanOrMachine(playerToGoFirst: player.human)
            cpu.humanVsMachine(squareId: 0)
        XCTAssertEqual(cpu.squaresLeftInGame(), 7, "both players should have taken a turn ")
            cpu.humanVsMachine(squareId: 2)
        XCTAssertEqual(cpu.squaresLeftInGame(), 5, "both players should have taken a turn ")

        XCTAssertEqual(cpu.gameSquares[1], 2, "cpu should have blocked")
        
        cpu.resetBoard()
//        cpu.whichPlayerGoesFirstHumanOrMachine(playerToGoFirst: player.computer)
        XCTAssertEqual(cpu.squaresLeftInGame(), 9)
       
        cpu.humanVsMachine(squareId: 4)
        XCTAssertEqual(cpu.squaresLeftInGame(), 7)
        
        cpu.humanVsMachine(squareId: 7)
        XCTAssertEqual(cpu.squaresLeftInGame(), 5)
        
        cpu.humanVsMachine(squareId: 5)
        XCTAssertEqual(cpu.squaresLeftInGame(), 3)
        
        cpu.humanVsMachine(squareId: 3)
        XCTAssertTrue(cpu.checkForThreeInARow())

    }
    
//    func testWhichPlayerGoesFirstHumanOrMachine() {
//        let player = GameController()
//        typealias goingFirst = GameController.PlayerGoingFirst
//        
//        player.whichPlayerGoesFirstHumanOrMachine(playerToGoFirst: goingFirst.computer)
//        
//    }
    
    func testHumanVsHuman() {
        let human = GameController()
        
        XCTAssertTrue(human.humanVsHuman(squareId: 0))
        XCTAssertTrue(human.humanVsHuman(squareId: 1))
        XCTAssertTrue(human.humanVsHuman(squareId: 2))
        XCTAssertTrue(human.humanVsHuman(squareId: 3))
        XCTAssertTrue(human.humanVsHuman(squareId: 4))
        XCTAssertTrue(human.humanVsHuman(squareId: 5))
        XCTAssertTrue(human.humanVsHuman(squareId: 6))
        XCTAssertTrue(human.humanVsHuman(squareId: 7))
        XCTAssertTrue(human.humanVsHuman(squareId: 8))
        
        XCTAssertEqual(human.gameSquares[0], 1, "should have playerId 1")
        XCTAssertEqual(human.gameSquares[1], 2)
        XCTAssertEqual(human.gameSquares[2], 1)
        XCTAssertEqual(human.gameSquares[3], 2)
        XCTAssertEqual(human.gameSquares[4], 1)
        XCTAssertEqual(human.gameSquares[5], 2)
        XCTAssertEqual(human.gameSquares[6], 1)
        XCTAssertEqual(human.gameSquares[7], 2)
        XCTAssertEqual(human.gameSquares[8], 1)
        
    }

}
































