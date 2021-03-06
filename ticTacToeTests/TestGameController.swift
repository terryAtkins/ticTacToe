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
    
    func testHumanAsTakenTurn() {
        let human = GameController()
        let button  = UIButton()

        XCTAssertEqual(human.controller.board.squaresSelectedDuringPlay.count, 0)
        human.humanHasTakenTurn(squareId: button)
        XCTAssertEqual(human.controller.board.squaresSelectedDuringPlay.count, 1)

    }
}

