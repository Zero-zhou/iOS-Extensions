//
//  NSMutableArray+Additions.swift
//  iTranslator
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
        let mutableArray = self
        if self.count >= maxLenght {
            mutableArray.removeLastObject()
        }
        mutableArray.insertObject(newValue, atIndex: 0)
        return mutableArray
    }
    
    /**
     the array should already have a fixed lenght, because the lenght of this array will never be mutated.
     remove array's last object and insert a new object in the first index.
     
     - parameter newValue:  the new object you want to insert in the fisrt index.
     
     - returns: return the new array.
     */
    func ausInsertNewElementRemoveLastOne(newValue newValue: NSObject) -> NSMutableArray {
        let mutableArray = self
        mutableArray.removeLastObject()
        mutableArray.insertObject(newValue, atIndex: 0)
        return mutableArray
    }
    
}