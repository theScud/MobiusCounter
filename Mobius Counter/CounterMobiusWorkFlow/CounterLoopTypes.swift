//
//  CounterLoopTypes.swift
//  Mobius Counter
//
//  Created by Sudeep Kini on 4/3/19.
//  Copyright © 2019 Sudeep Kini. All rights reserved.
//

import Foundation
import MobiusExtras
import MobiusCore


class CounterLoopTypes: LoopTypes  {
    typealias Event = CounterEvent
    typealias Effect = CounterEffects
    typealias Model = CounterModel
}
