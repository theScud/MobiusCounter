//
//  MobusCounterLogic.swift
//  Mobius Counter
//
//  Created by Sudeep Kini on 4/3/19.
//  Copyright © 2019 Sudeep Kini. All rights reserved.
//

import Foundation
import MobiusExtras

typealias CounterModel = Int


enum CounterEvents {
    case incriment
    case decriment
}


protocol CounterLogic {
    func update(model:CounterModel, forEvent: CounterEvents) -> CounterModel
}


struct CounterBrain:CounterLogic {
    func update(model:CounterModel, forEvent: CounterEvents) -> CounterModel{
        switch forEvent {
            case .incriment: return model+1
            case .decriment: return model
        }
    }
}
