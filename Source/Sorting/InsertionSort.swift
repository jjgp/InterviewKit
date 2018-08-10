//
//  InsertionSort.swift
//  InterviewKit
//
//  Created by Jason Prasad on 8/9/18.
//  Copyright © 2018 JJGP. All rights reserved.
//

import Foundation

public func insertionSort<C: MutableCollection & BidirectionalCollection>(
    _ elements: inout C,
    subRange range: Range<C.Index>
    ) where C.Element : Comparable {
    _insertionSort(&elements, subRange: range) { $0 < $1 }
}

public func insertionSort<C: MutableCollection & BidirectionalCollection>(
    _ elements: inout C,
    subRange range: Range<C.Index>,
    by areInIncreasingOrder: (C.Element, C.Element) throws -> Bool
    ) rethrows {
    try _insertionSort(&elements, subRange: range, by: areInIncreasingOrder)
}

func _insertionSort<C: MutableCollection & BidirectionalCollection>(
    _ elements: inout C,
    subRange range: Range<C.Index>,
    by areInIncreasingOrder: (C.Element, C.Element) throws -> Bool
    ) rethrows {
    guard !range.isEmpty else {
        return
    }
    
    let start = range.lowerBound
    var i = elements.index(after: start)
    
    while i != range.upperBound {
        let key = elements[i]
        var j = i
        
        repeat {
            let candidate = elements[elements.index(before: j)]
            
            do {
                guard try areInIncreasingOrder(key, candidate) else {
                    break
                }
            } catch {
                elements[j] = key
                throw error
            }
            
            elements[j] = candidate
            elements.formIndex(before: &j)
        } while j > start
        
        if j != i {
            elements[j] = key
        }
        elements.formIndex(after: &i)
    }
}
