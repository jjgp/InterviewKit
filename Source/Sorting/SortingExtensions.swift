//
//  SortingExtensions.swift
//  InterviewKit
//
//  Created by Jason Prasad on 8/9/18.
//  Copyright © 2018 JJGP. All rights reserved.
//

import Foundation

extension MutableCollection
where Self: RandomAccessCollection, Element : Comparable {
    
    // MARK: - Insertion Sort
    
    public mutating func insertionSort() {
        let didSortUnsafeBuffer = _withUnsafeMutableBufferPointerIfSupported {
            buffer -> Void? in
            buffer.insertionSort()
        }
        if didSortUnsafeBuffer == nil {
            _insertionSort(&self, subRange: startIndex..<endIndex, by: <)
        }
    }
    
    public mutating func insertionSort(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows {
        let didSortUnsafeBuffer = _withUnsafeMutableBufferPointerIfSupported {
            buffer -> Void? in
            buffer.insertionSort()
        }
        if didSortUnsafeBuffer == nil {
            try _insertionSort(&self, subRange: startIndex..<endIndex, by: areInIncreasingOrder)
        }
    }
    
}
