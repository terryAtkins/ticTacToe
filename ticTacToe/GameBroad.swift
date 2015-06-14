//
//  GameBroad.swift
//  ticTacToe
//
//  Created by terry atkins on 09/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

public class GameBoard {
    
     public var gameSquares = [[0,0,0],[0,0,0],[0,0,0]]
//    var gameSquares = [[0,0,0],[0,0,0],[0,0,0]]
    var bottomLeftSquare :Int?
    var bottomCenterSquare :Int?
    var bottomRightSquare :Int?
    var middleLeftSquare :Int?
    var middleCenterSquare :Int?
    var middleRightSquare :Int?
    var topLeftSquare :Int?
    var topCenterSquare :Int?
    var topRightSquare :Int?
    
    public init() {
    }
    
    public func upDateNames() {
        
        bottomLeftSquare = gameSquares[2][0]
        bottomCenterSquare = gameSquares[2][1]
        bottomRightSquare = gameSquares[2][2]
        middleLeftSquare = gameSquares[1][0]
        middleCenterSquare = gameSquares[1][1]
        middleRightSquare = gameSquares[1][2]
        topLeftSquare = gameSquares[0][0]
        topCenterSquare = gameSquares[0][1]
        topRightSquare = gameSquares[0][2]
    }
    
    public func updateGameBoardWhenSquareSelected(playerId player: Int, rowId row :Int, columnId column :Int ) {
        
        gameSquares[row][column] = player
        
    }
    
    public func resetBoard() {
        
        gameSquares = [[0,0,0],[0,0,0],[0,0,0]]
    }
    
    public func isSquareStillInPlay(rowId row:Int, columnId column :Int) -> Bool {
        
        if gameSquares[row][column] == 0 {
            
            return true
        }
        
        return false
    }
    
   
    

    
    //    public func checkForTwoInARowToBlock() -> Bool {
    //
    //        if isThereTwoInARow_Vertical() || isThereTwoInARow_Horizontal() || isThereTwoInARow_Diagonal() {
    //            return true
    //        }
    //
    //        return false
    //    }
    

        public func isThereTwoInARow_Vertical() -> Bool {
        
        upDateNames()
        
        if isThereTwoMatchesInThe_LeftColumn() || isThereTwoMatchesInThe_CenterColumn() || isThereTwoMatchesInThe_RightColumn() {
            
            return true
        }
        
        return false
    }
    
            func isThereTwoMatchesInThe_LeftColumn() -> Bool {
        
        if bottomLeftSquare == middleLeftSquare && bottomLeftSquare != 0 || bottomLeftSquare == topLeftSquare && bottomLeftSquare != 0 || middleLeftSquare == topLeftSquare && middleLeftSquare != 0 {
            
            return true
            
        } else {
            
            return false
        }
    }
    
            func isThereTwoMatchesInThe_CenterColumn() -> Bool {
        
        if bottomCenterSquare == middleCenterSquare && bottomCenterSquare != 0 || bottomCenterSquare == topCenterSquare && bottomCenterSquare != 0 || middleCenterSquare == topCenterSquare && middleCenterSquare != 0 {
            
            return true
            
        } else {
            
            return false
        }
    }
    
            func isThereTwoMatchesInThe_RightColumn() -> Bool {
        
        if bottomRightSquare == middleRightSquare && bottomRightSquare != 0 || bottomRightSquare == topRightSquare && bottomRightSquare != 0 || bottomRightSquare == middleRightSquare && middleRightSquare != 0 {
            
            return true
            
        } else {
            
            return false
        }
    }
    

        public func isThereTwoInARow_Horizontal() -> Bool {
        
        upDateNames()
        
        if isThereTwoMathesInThe_TopRow() || isThereTwoMathesInThe_CenterRow() || isThereTwoMathesInThe_BottomRow()  {
            
            return true
        }
        
        return false
    }
    
            func isThereTwoMathesInThe_TopRow() -> Bool {
        
        if bottomLeftSquare == bottomCenterSquare && bottomLeftSquare != 0 || bottomLeftSquare == bottomRightSquare && bottomLeftSquare != 0 || bottomCenterSquare == bottomRightSquare && bottomCenterSquare != 0 {
            
            return true
            
        } else {
            
            return false
        }
        
    }
    
            func isThereTwoMathesInThe_CenterRow() -> Bool {
        
        if middleLeftSquare == middleCenterSquare && middleLeftSquare != 0 || middleLeftSquare == middleRightSquare && middleLeftSquare != 0 || middleCenterSquare == middleRightSquare && middleCenterSquare != 0  {
            
            return true
            
        } else {
            
            return false
        }
    }
    
            func isThereTwoMathesInThe_BottomRow() -> Bool {
        
        if topLeftSquare == topCenterSquare && topLeftSquare != 0 || topLeftSquare == topRightSquare && topLeftSquare != 0 || topCenterSquare == topRightSquare && topCenterSquare != 0  {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    
        public func isThereTwoInARow_Diagonal() -> Bool {
        
        if isThereTwoMathesFromTopLeftToBottomRight_Diagonal() || isThereTwoMathesFromBottomLeftToTopRight_Diagonal() {
            
            return true
            
        } else {
            
            return false
        }
    }
    
            func isThereTwoMathesFromTopLeftToBottomRight_Diagonal() -> Bool {
        
        if topLeftSquare == middleCenterSquare && topLeftSquare != 0 || topLeftSquare == bottomRightSquare && topLeftSquare != 0  || topLeftSquare == middleCenterSquare && topLeftSquare != 0 {
            
            return true
            
        } else {
            
            return false
        }
    }
    
            func isThereTwoMathesFromBottomLeftToTopRight_Diagonal() -> Bool {
        
        if bottomLeftSquare == middleCenterSquare && bottomLeftSquare != 0 || bottomLeftSquare == topRightSquare && bottomLeftSquare != 0 || middleCenterSquare == topRightSquare && middleCenterSquare != 0 {
            
            return true
            
        } else {
            
            return false
        }
    }
    
   
    
    public func checkForThreeInARow_ToWin() -> Bool {
        
        if isThereThreeInARow_Vertical() || isThereThreeInARow_Horizontal() || isThereThreeInARow_Diagonal() {
            
            return true
        }
        
        return false
    }
    
        public func isThereThreeInARow_Vertical() -> Bool {
        
        upDateNames()
        
        if isThereThreeMatchesInThe_LeftColumn() || isThereThreeMatchesInThe_CenterColumn() || isThereThreeMatchesInThe_RightColumn() {
            
            return true
            
        }  else {
            
            return false
        }
        
    }
  
            func isThereThreeMatchesInThe_LeftColumn() -> Bool {
        
        if bottomLeftSquare != 0  && bottomLeftSquare == middleLeftSquare && bottomLeftSquare == topLeftSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
            func isThereThreeMatchesInThe_CenterColumn() -> Bool {
        
        if bottomCenterSquare != 0 && bottomCenterSquare == middleCenterSquare && bottomCenterSquare == topCenterSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
            func isThereThreeMatchesInThe_RightColumn() -> Bool {
        
        if bottomRightSquare != 0 && bottomRightSquare == middleRightSquare && bottomRightSquare == topRightSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    
        public func isThereThreeInARow_Horizontal() -> Bool {
        
        upDateNames()
        
        
        if isThereThreeMatcesInThe_BottomRow() || isThereThreeMatcesInThe_MiddleRow() || isThereThreeMatcesInThe_TopRow() {
            
            return true
            
        } else {
            
            return false
        }
        
    }
   
            func isThereThreeMatcesInThe_BottomRow() -> Bool {
        
        if bottomLeftSquare != 0 && bottomLeftSquare == bottomCenterSquare && bottomLeftSquare == bottomRightSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
            func isThereThreeMatcesInThe_MiddleRow() -> Bool {
        
        if middleLeftSquare != 0 && middleLeftSquare == middleCenterSquare && middleLeftSquare == middleRightSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
            func isThereThreeMatcesInThe_TopRow() -> Bool {
        
        if  topLeftSquare != 0 && topLeftSquare == topCenterSquare && topLeftSquare == topRightSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
   
        public func isThereThreeInARow_Diagonal() -> Bool {
        
        upDateNames()
        
        if isThereThreeMatchesFromBottomLeftToTopRight_Diagonal() || isThereThreeMatchesFromTopLeftToBottomRight_Diagonal() {
            
            return true
            
        }  else {
            
            return false
        }
    }

            func isThereThreeMatchesFromBottomLeftToTopRight_Diagonal() -> Bool {
        
        if bottomLeftSquare != 0 && bottomLeftSquare == middleCenterSquare && bottomLeftSquare == topRightSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
            func isThereThreeMatchesFromTopLeftToBottomRight_Diagonal() -> Bool {
        
        if topLeftSquare != 0 && topLeftSquare == middleCenterSquare && topLeftSquare == bottomRightSquare {
            
            return true
            
        } else {
            
            return false
        }
    }

}


