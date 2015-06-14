//
//  TwoInARow.swift
//  ticTacToe
//
//  Created by terry atkins on 14/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

public class TwoInARow :GameBoard {
   
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
        
        upDateNames()
        
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
    
}
