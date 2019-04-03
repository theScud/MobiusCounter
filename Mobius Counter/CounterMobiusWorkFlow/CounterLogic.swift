//
//  CounterLogic.swift
//  Mobius Counter
//
//  Created by Sudeep Kini on 4/3/19.
//  Copyright © 2019 Sudeep Kini. All rights reserved.
//

import Foundation
import MobiusExtras
import MobiusCore


func counterUpdate(Model:CounterModel,Event:CounterEvent) -> Next<CounterModel,CounterEffects> {
    switch Event {
    case .incriment:
        return .next(Model+1)
    case .decriment:
        if Model == 0 {
            return .dispatchEffects([.showLessthanZeroError])
        }
        return .next(Model-1)
    default:
         return .noChange
    }
    
}
