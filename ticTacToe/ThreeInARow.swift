//
//  ThreeInARow.swift
//  ticTacToe
//
//  Created by terry atkins on 10/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.


import UIKit

public class ThreeInARow : GameBoard {
    
    public func checkForThreeInARow_ToWin() -> Bool {
        
        if isThereThreeInARow_Vertical() || isThereThreeInARow_Horizontal() || isThereThreeInARow_Diagonal() {
            
            return true
        }
        
        return false
    }
    
    public func isThereThreeInARow_Vertical() -> Bool {
        
        upDateNames()
        
        if isThereThreeInARow_LeftColumn() || isThereThreeInARow_CenterColumn() || isThereThreeInARow_RightColumn() {
            
            return true
            
        }  else {
            
            return false
        }
        
    }
    
    func isThereThreeInARow_LeftColumn() -> Bool {
        
        if bottomLeftSquare != 0  && bottomLeftSquare == middleLeftSquare && bottomLeftSquare == topLeftSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    func isThereThreeInARow_CenterColumn() -> Bool {
        
        if bottomCenterSquare != 0 && bottomCenterSquare == middleCenterSquare && bottomCenterSquare == topCenterSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    func isThereThreeInARow_RightColumn() -> Bool {
        
        if bottomRightSquare != 0 && bottomRightSquare == middleRightSquare && bottomRightSquare == topRightSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    
    public func isThereThreeInARow_Horizontal() -> Bool {
        
        upDateNames()
        
        
        if isThereThreeInARow_BottomRow() || isThereThreeInARow_MiddleRow() || isThereThreeInARow_TopRow() {
            
            return true
            
        } else {
            
            return false
        }
        
    }
    
    func isThereThreeInARow_BottomRow() -> Bool {
        
        if bottomLeftSquare != 0 && bottomLeftSquare == bottomCenterSquare && bottomLeftSquare == bottomRightSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    func isThereThreeInARow_MiddleRow() -> Bool {
        
        if middleLeftSquare != 0 && middleLeftSquare == middleCenterSquare && middleLeftSquare == middleRightSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    func isThereThreeInARow_TopRow() -> Bool {
        
        if  topLeftSquare != 0 && topLeftSquare == topCenterSquare && topLeftSquare == topRightSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    
    public func isThereThreeInARow_Diagonal() -> Bool {
        
        upDateNames()
        
        if isThereThreeInARowFromBottomLeftToTopRight_Diagonal() || isThereThreeInARowFromTopLeftToBottomRight_Diagonal() {
            
            return true
            
        }  else {
            
            return false
        }
    }
    
    func isThereThreeInARowFromBottomLeftToTopRight_Diagonal() -> Bool {
        
        if bottomLeftSquare != 0 && bottomLeftSquare == middleCenterSquare && bottomLeftSquare == topRightSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
    func isThereThreeInARowFromTopLeftToBottomRight_Diagonal() -> Bool {
        
        if topLeftSquare != 0 && topLeftSquare == middleCenterSquare && topLeftSquare == bottomRightSquare {
            
            return true
            
        } else {
            
            return false
        }
    }
    
}
