//
//  Mobius_CounterTests.swift
//  Mobius CounterTests
//
//  Created by Sudeep Kini on 4/3/19.
//  Copyright © 2019 Sudeep Kini. All rights reserved.
//

@testable import Mobius_Counter
import XCTest
import MobiusTest

class Mobius_CounterTests: XCTestCase {
    let updateSpec = UpdateSpec<CounterLoopTypes>(counterUpdate)
    
    func testIncerment(){
        updateSpec.given(1)
                  .when(.incriment)
                  .then(
                    assertThatNext(
                        hasModel(2),
                        hasNoEffects()
                    ))
    }
    
    func testDecriment(){
        updateSpec.given(1)
                  .when(.decriment)
                  .then(
                    assertThatNext(
                        hasModel(0),
                        hasNoEffects()
                    ))
    }
    
    func testLessthanZero(){
        updateSpec.given(0)
                  .when(.decriment)
                  .then(
                    assertThatNext(
                            hasNoModel(),
                            hasEffects([.showLessthanZeroError]
                    ))
                   )
    }
    
}
