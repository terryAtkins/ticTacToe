////
////  TestMiniMaX.swift
////  ticTacToe
////
////  Created by terry atkins on 09/07/2015.
////  Copyright (c) 2015 terry atkins. All rights reserved.
////
//
//
//import UIKit
//import XCTest
//import ticTacToe
//
//class miniMax2Tests: XCTestCase {
//    
// 
//    
//    func testMiniMAx() {
//        let game = MiniMax()
//        var gameBoard: [Int] = []
//        
//        game.board.gameSquares = [1,0,2,0,1,0,2,0,0]
//        game.board.squaresSelectedDuringPlay = [0,2,4,6,7]
//        gameBoard = game.board.gameSquares
//        XCTAssertEqual(game.miniMax(dummyBoard: gameBoard, playerId: 1),8, "player 1 didn't choose 8 to win")
//
//        game.board.gameSquares = [2,0,1,0,2,0,1,0,0]
//        game.board.squaresSelectedDuringPlay = [0,2,4,6]
//        gameBoard = game.board.gameSquares
//        
//        XCTAssertEqual(game.miniMax(dummyBoard: gameBoard, playerId: 2),8, "player 2 didn't choose 8 to win")
//        
//        game.board.gameSquares = [1,0,1,0,2,0,0,0,2]
//        game.board.squaresSelectedDuringPlay = [0,2,4,8]
//        gameBoard = game.board.gameSquares
//        XCTAssertEqual(game.miniMax(dummyBoard: gameBoard, playerId: 1),1, "player 1 didn't choose 1 to win")
//
//        game.board.gameSquares = [1,0,0,0,2,0,2,0,1]
//        game.board.squaresSelectedDuringPlay = [0,4,6,8]
//        gameBoard = game.board.gameSquares
//        
//        XCTAssertEqual(game.miniMax(dummyBoard: gameBoard, playerId: 2),2, "player 2 didn't choose 8 to win")
//        
//    }
//    
//}
