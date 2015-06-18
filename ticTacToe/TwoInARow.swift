//
//  TwoInARow.swift
//  ticTacToe
//
//  Created by terry atkins on 14/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

public class TwoInARow :GameBoard {
   
        public func checkForTwoInARow() -> Bool {
    
            if isThereMatchingPairs_Vertical() || isThereMatchingPairs_Horizontal() || isThereMatchingPairs_Diagonal() {
                return true
            }
    
            return false
        }
    
    
    public func isThereMatchingPairs_Vertical() -> Bool {
        
        upDateNames()
        
        if isThereTwoMatching_LeftColumn() || isThereTwoMatching_CenterColumn() || isThereTwoMatching_RightColumn() {
            
            return true
        }
        
        return false
    }
    
    func isThereTwoMatching_LeftColumn() -> Bool {
        
        if bottomLeftSquare == middleLeftSquare && bottomLeftSquare != 0 || bottomLeftSquare == topLeftSquare && bottomLeftSquare != 0 || middleLeftSquare == topLeftSquare && middleLeftSquare != 0 {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    func isThereTwoMatching_CenterColumn() -> Bool {
        
        if bottomCenterSquare == middleCenterSquare && bottomCenterSquare != 0 || bottomCenterSquare == topCenterSquare && bottomCenterSquare != 0 || middleCenterSquare == topCenterSquare && middleCenterSquare != 0 {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    func isThereTwoMatching_RightColumn() -> Bool {
        
        if bottomRightSquare == middleRightSquare && bottomRightSquare != 0 || bottomRightSquare == topRightSquare && bottomRightSquare != 0 || bottomRightSquare == middleRightSquare && middleRightSquare != 0 {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    
    public func isThereMatchingPairs_Horizontal() -> Bool {
        
        upDateNames()
        
        if isThereTwoMatching_TopRow() || isThereTwoMatching_CenterRow() || isThereTwoMatching_BottomRow()  {
            
            return true
        }
        
        return false
    }
    
    func isThereTwoMatching_TopRow() -> Bool {
        
        if bottomLeftSquare == bottomCenterSquare && bottomLeftSquare != 0 || bottomLeftSquare == bottomRightSquare && bottomLeftSquare != 0 || bottomCenterSquare == bottomRightSquare && bottomCenterSquare != 0 {
            
            return true
            
        } else {
            
            return false
        }
        
    }
    
    func isThereTwoMatching_CenterRow() -> Bool {
        
        if middleLeftSquare == middleCenterSquare && middleLeftSquare != 0 || middleLeftSquare == middleRightSquare && middleLeftSquare != 0 || middleCenterSquare == middleRightSquare && middleCenterSquare != 0  {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    func isThereTwoMatching_BottomRow() -> Bool {
        
        if topLeftSquare == topCenterSquare && topLeftSquare != 0 || topLeftSquare == topRightSquare && topLeftSquare != 0 || topCenterSquare == topRightSquare && topCenterSquare != 0  {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    
    public func isThereMatchingPairs_Diagonal() -> Bool {
        
        upDateNames()
        
        if isThereTwoMatchingFromTopLeft_Diagonal() || isThereTwoMatchingFromBottomLeft_Diagonal() {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    func isThereTwoMatchingFromTopLeft_Diagonal() -> Bool {
        
        if topLeftSquare == middleCenterSquare && topLeftSquare != 0 || topLeftSquare == bottomRightSquare && topLeftSquare != 0  || topLeftSquare == middleCenterSquare && topLeftSquare != 0 {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    func isThereTwoMatchingFromBottomLeft_Diagonal() -> Bool {
        
        if bottomLeftSquare == middleCenterSquare && bottomLeftSquare != 0 || bottomLeftSquare == topRightSquare && bottomLeftSquare != 0 || middleCenterSquare == topRightSquare && middleCenterSquare != 0 {
            
            return true
            
        } else {
            
            return false
        }
    }
    
//   public func playerHasForkBlock() -> Bool {
//        if checkForTwoInARow() {
//        return true
//    }
//    return false
//    }
    
}
