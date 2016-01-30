//
//  NSMutableArray+Extension.swift
//
//  Created by Augus on 11/8/15.
//  Copyright © 2015 iAugus. All rights reserved.
//

import Foundation


extension NSMutableArray {
    /**
     
     remove array's last object and insert a new object in the first index.
     
     - parameter newValue:  the new object you want to insert in the fisrt index.
     - parameter maxLenght: set a fixed lenght for the array.
     
     - returns: return the new array.
     */
    func ausInsertNewElementRemoveLastOne(newValue newValue: NSObject, maxLenght: Int) -> NSMutableArray {
        if self.count >= maxLenght {
            self.removeLastObject()
        }
        self.insertObject(newValue, atIndex: 0)
        return self
    }
    
    /**
     the array should already have a fixed lenght, because the lenght of this array will never be mutated.
     remove array's last object and insert a new object in the first index.
     
     - parameter newValue:  the new object you want to insert in the fisrt index.
     
     - returns: return the new array.
     */
    func ausInsertNewElementRemoveLastOne(newValue newValue: NSObject) -> NSMutableArray {
        self.removeLastObject()
        self.insertObject(newValue, atIndex: 0)
        return self
    }
    
    /**
     if array contains the new object, just move it to fisrt index.
     */
    func ausFilterInsertNewElementRemoveLastOne(newValue newValue: NSObject, maxLenght: Int) -> NSMutableArray {
        if self.containsObject(newValue) {
            let index = self.indexOfObject(newValue)
            self.ausMoveObjectAtIndex(fromIndex: index, toIndex: 0)
            return self
        } else {
            self.ausInsertNewElementRemoveLastOne(newValue: newValue, maxLenght: maxLenght)
            return self
        }
    }
    
    /**
     if array contains the new object, just move it to fisrt index.
     */
    func ausFilterInsertNewElementRemoveLastOne(newValue newValue: NSObject) -> NSMutableArray {
        if self.containsObject(newValue) {
            let index = self.indexOfObject(newValue)
            self.ausMoveObjectAtIndex(fromIndex: index, toIndex: 0)
            return self
        } else {
            self.ausInsertNewElementRemoveLastOne(newValue: newValue)
            return self
        }
    }
    
    func ausMoveObjectAtIndex(fromIndex fromIndex: Int, toIndex: Int) {
        if fromIndex < self.count && toIndex < self.count {
            let object = self.objectAtIndex(fromIndex)
            self.removeObjectAtIndex(fromIndex)
            self.insertObject(object, atIndex: toIndex)
        }
    }
}