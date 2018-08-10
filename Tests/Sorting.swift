//
//  Sorting.swift
//  Tests
//
//  Created by Jason Prasad on 8/9/18.
//  Copyright © 2018 JJGP. All rights reserved.
//

import XCTest
@testable import InterviewKit

class Sorting: XCTestCase {
        
    func testInsertionSort() {
        var arr = [5, 4, 3, 2, 1, 0]
        arr.insertionSort()
        
        var randarr = [Int]()
        for _ in 0..<1_000_000 {
            randarr.append(Int(arc4random()))
        }
        randarr.insertionSort()
        
        XCTAssertEqual(arr, [0, 1, 2, 3, 4, 5])
    }
    
}
