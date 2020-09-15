//
//  PlayerState.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 13.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class PlayerState: GameStateProtocol {
    
    private unowned var context: GameStrategySelector?
    
    private var curContext: GameStrategySelector {
        guard let context = context else { fatalError("") }
        return context
    }
    
    private var timer: Timer?

    required init(context: GameStrategySelector) {
        self.context = context
    }
    
    
    func addMark(at location: Int) {
        curContext.tryChangePlayer()
        curContext.board.addMark(at: location)
        curContext.updateBoardView()
        if curContext.isFinish() {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.finish), userInfo: nil, repeats: false)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.next), userInfo: nil, repeats: false)
        }
    }
    
    
    @objc private func next() {
        let clazz = curContext.getStateClass(.human)
        let state = clazz.init(context: curContext)
        curContext.setNextState(state: state)
        timer?.invalidate()
    }
    
    
    @objc private func finish() {
        let finishState = GameFinishState(context: curContext)
        curContext.setNextState(state: finishState)
        timer?.invalidate()
    }
}
