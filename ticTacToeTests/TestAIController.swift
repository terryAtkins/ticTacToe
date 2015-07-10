//
//  TestAIController.swift
//  ticTacToe
//
//  Created by terry atkins on 10/07/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit
import XCTest
import ticTacToe

class TestAIController: XCTestCase {

    func testMiniMAx() {
        let game = AIController()
        var gameBoard: [Int] = []
        
        game.board.gameSquares = [1,0,2,0,1,0,2,0,0]
        game.board.squaresSelectedDuringPlay = [0,2,4,6]
        gameBoard = game.board.gameSquares
        XCTAssertEqual(game.miniMax(),8, "player 1 didn't choose 8 to win")
        
        game.board.gameSquares = [2,1,1,0,2,0,1,0,0]
        game.board.squaresSelectedDuringPlay = [0,1,2,4,6]
        gameBoard = game.board.gameSquares
        XCTAssertEqual(game.miniMax(),8, "player 2 didn't choose 8 to win")
        
        game.board.gameSquares = [1,0,1,0,2,0,0,0,2]
        game.board.squaresSelectedDuringPlay = [0,2,4,8]
        gameBoard = game.board.gameSquares
        XCTAssertEqual(game.miniMax(),1, "player 1 didn't choose 1 to win")
        
        game.board.gameSquares = [1,0,0,0,2,0,2,0,1]
        game.board.squaresSelectedDuringPlay = [0,4,6,8]
        gameBoard = game.board.gameSquares
        
        XCTAssertEqual(game.miniMax(),2, "player 2 didn't choose 8 to win")
        
        game.board.gameSquares = [1,0,1,0,2,0,0,0,2]
        game.board.squaresSelectedDuringPlay = [0,2,4,8]
        gameBoard = game.board.gameSquares
        XCTAssertEqual(game.miniMax(),1, "player 1 didn't choose 1 to win")
        
        game.board.gameSquares = [2,1,2,1,1,0,2,0,0]
        game.board.squaresSelectedDuringPlay = [0,1,2,3,4,6]
        gameBoard = game.board.gameSquares
        XCTAssertEqual(game.miniMax(),5, "player 2 didn't choose 5 to win")
        
    }

}
