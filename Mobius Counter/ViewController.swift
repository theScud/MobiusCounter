//
//  ViewController.swift
//  Mobius Counter
//
//  Created by Sudeep Kini on 4/3/19.
//  Copyright © 2019 Sudeep Kini. All rights reserved.
//

import UIKit
import MobiusExtras
import MobiusCore

class ViewController: UIViewController {
    var loop:MobiusLoop<CounterLoopTypes>?
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func incrimentCounter(_ sender: Any) {
        loop!.dispatchEvent(.incriment)
    }
    
    @IBAction func decrimentCounter(_ sender: Any) {
        loop!.dispatchEvent(.decriment)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let serialQueue = DispatchQueue.main
        var loopBuilder:Mobius.Builder<CounterLoopTypes> = Mobius.loop(update: counterUpdate, effectHandler: self)
        loopBuilder = loopBuilder.withEffectQueue(serialQueue)
        self.loop = loopBuilder.start(from: 0)
        loop?.addObserver({ (model) in
            DispatchQueue.main.async {
                 self.resultLabel.text = "\(model)"
            }
        })

    }
    
    deinit {
        loop?.dispose()
    }
}


extension ViewController: Connectable {
    func connect(_ consumer: @escaping (CounterEvent) -> ()) -> Connection<CounterEffects> {
        
        return Connection<CounterEffects>(acceptClosure: accept, disposeClosure: dispose)
        
    }
    typealias InputType = CounterEffects
    typealias OutputType = CounterEvent
    
    func accept(_ effect: CounterEffects) {
        switch effect {
        case .showLessthanZeroError:
            let alertController = UIAlertController(title: nil, message: "you cannot go less than zero ", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    func dispose() {}
}

