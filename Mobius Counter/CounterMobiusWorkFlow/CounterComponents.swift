//
//  CounterComponents.swift
//  Mobius Counter
//
//  Created by Sudeep Kini on 4/3/19.
//  Copyright © 2019 Sudeep Kini. All rights reserved.
//

import Foundation

typealias CounterModel = Int

enum CounterEvent {
    case incriment
    case decriment
}

enum CounterEffects {
    case showLessthanZeroError
}
