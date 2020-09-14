//
//  AiState.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 13.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class AiState: GameStateProtocol {
    
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
        calcMark()
    }

    func addMark(at location: Int) {
        print("AiState: addMark(): can't handle.")
    }
    

    private func calcMark() {
        let pos = findBestMove(curContext.board)
        curContext.board.addMark(at: pos)
        curContext.updateBoardView()
        if curContext.isFinish() {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.finish), userInfo: nil, repeats: false)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.next), userInfo: nil, repeats: false)
        }
    }
    
    private func changePlayer(lastPlayer: PlayerEnum) {
        curPlayer = curContext.getNextPlayer(lastPlayer: lastPlayer)
        curContext.board.setPlayer(player: curPlayer)
    }
    
    @objc private func next() {
        changePlayer(lastPlayer: curPlayer)
        curContext.setNextState(state: PlayerState(context: curContext, lastPlayer: curPlayer))
        timer?.invalidate()
    }
    
    
    @objc private func finish() {
        let finishState = GameFinishState(context: curContext, lastPlayer: curPlayer)
        curContext.setNextState(state: finishState)
        timer?.invalidate()
    }
}
