//
//  BlindlyState.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 14.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class BlindlyPlaceState: GameStateProtocol {
    
    private unowned var context: GameStrategySelector?
    private var curContext: GameStrategySelector {
        guard let context = context else { fatalError("") }
        return context
    }
    private var timer: Timer?
    private var curPlayer: PlayerEnum!
    
    required init(context: GameStrategySelector, lastPlayer: PlayerEnum) {
        self.context = context
        curPlayer = lastPlayer
    }
    
    private func setPlayer(lastPlayer: PlayerEnum) {
        curPlayer = curContext.getNextPlayer(lastPlayer: lastPlayer)
        curContext.board.setPlayer(player: curPlayer)
    }
    
    func addMark(at location: Int) {
        guard let board = curContext.board as? BoardBlindly
        else { return }
        
        setPlayer(lastPlayer: curPlayer)
        board.addMark(player: curPlayer, at: location)
        curContext.updateBoardView()
        if curContext.getStep() == 10 {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.next), userInfo: nil, repeats: false)
        }
    }
    
    
    @objc private func next() {
        let finishState = BlindlyFireState(context: curContext, lastPlayer: curPlayer)
        curContext.setNextState(state: finishState)
        timer?.invalidate()
    }
}

