//
//  ThreeInARow.swift
//  ticTacToe
//
//  Created by terry atkins on 10/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.


import UIKit

public class ThreeInARow : GameBoard {
        
    public func checkForThreeInARow() -> Bool {
        upDateNames()
        
        if thereIsThreeInARow_Vertical() || thereIsThreeInARow_Horizontal() || thereIsThreeInARow_Diagonal() {
            return true
        }
        return false
    }
    
    public func thereIsThreeInARow_Vertical() -> Bool {
        if thereIsThreeInARow_LeftColumn() || thereIsThreeInARow_CenterColumn() || thereIsThreeInARow_RightColumn() {
            return true
        } else {
            return false
        }
    }
    
   public func thereIsThreeInARow_LeftColumn() -> Bool {
        upDateNames()
        
        if bottomLeftSquare != 0  && bottomLeftSquare == middleLeftSquare && bottomLeftSquare == topLeftSquare {
            return true
        } else {
            return false
        }
    }
    
    func thereIsThreeInARow_CenterColumn() -> Bool {
        upDateNames()
        
        if bottomCenterSquare != 0 && bottomCenterSquare == middleCenterSquare && bottomCenterSquare == topCenterSquare {
            return true
        } else {
            return false
        }
    }
    
    func thereIsThreeInARow_RightColumn() -> Bool {
        upDateNames()
        
        if bottomRightSquare != 0 && bottomRightSquare == middleRightSquare && bottomRightSquare == topRightSquare {
            return true
        } else {
            return false
        }
    }
    
    
    public func thereIsThreeInARow_Horizontal() -> Bool {
        upDateNames()
        
        if thereIsThreeInARow_BottomRow() || thereIsThreeInARow_MiddleRow() || thereIsThreeInARow_TopRow() {
            return true
        } else {
            return false
        }
    }
    
    func thereIsThreeInARow_BottomRow() -> Bool {
        upDateNames()
        
        if bottomLeftSquare != 0 && bottomLeftSquare == bottomCenterSquare && bottomLeftSquare == bottomRightSquare {
            return true
        } else {
            return false
        }
    }
    
    func thereIsThreeInARow_MiddleRow() -> Bool {
        upDateNames()
        
        if middleLeftSquare != 0 && middleLeftSquare == middleCenterSquare && middleLeftSquare == middleRightSquare {
            return true
        } else {
            return false
        }
    }
    
    func thereIsThreeInARow_TopRow() -> Bool {
        upDateNames()
        
        if  topLeftSquare != 0 && topLeftSquare == topCenterSquare && topLeftSquare == topRightSquare {
            return true
        } else {
            return false
        }
    }
    
    
    public func thereIsThreeInARow_Diagonal() -> Bool {
        upDateNames()
        
        if thereIsThreeInARowFromBottomLeftToTopRight_Diagonal() || thereIsThreeInARowFromTopLeftToBottomRight_Diagonal() {
            return true
        }  else {
            return false
        }
    }
    
    func thereIsThreeInARowFromBottomLeftToTopRight_Diagonal() -> Bool {
        upDateNames()
        
        if bottomLeftSquare != 0 && bottomLeftSquare == middleCenterSquare && bottomLeftSquare == topRightSquare {
            return true
        } else {
            return false
        }
    }
    
    func thereIsThreeInARowFromTopLeftToBottomRight_Diagonal() -> Bool {
        upDateNames()
        
        if topLeftSquare != 0 && topLeftSquare == middleCenterSquare && topLeftSquare == bottomRightSquare {
            return true
        } else {
            return false
        }
    }
    
}
