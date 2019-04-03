//
//  Mobius_CounterTests.swift
//  Mobius CounterTests
//
//  Created by Sudeep Kini on 4/3/19.
//  Copyright © 2019 Sudeep Kini. All rights reserved.
//

import XCTest
@testable import Mobius_Counter

class Mobius_CounterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIncrement() {
        let model = 1
        let counterlogic = CounterBrain()
        let model2 = counterlogic.update(model: model, forEvent: .incriment)
        XCTAssertEqual(model2, 2)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
