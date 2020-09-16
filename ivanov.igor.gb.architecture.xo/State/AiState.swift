//
//  AiState.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 13.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class AiState: GameStateProtocol {
    
    private unowned var context: GameSession?
    private var curContext: GameSession {
        guard let context = context else { fatalError("") }
        return context
    }
    private var timer: Timer?
    
    required init(context: GameSession) {
        self.context = context
        calcMark()
    }

    func addMark(at location: Int) {
        print("AiState: addMark(): can't handle.")
    }
    

    private func calcMark() {
        curContext.tryChangePlayer()
        let pos = findBestMove(curContext.board)
        curContext.board.addMark(at: pos)
        curContext.logOperation(pos)
        curContext.updateBoardView()
        if curContext.isFinish() {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.finish), userInfo: nil, repeats: false)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.next), userInfo: nil, repeats: false)
        }
    }
    
    @objc private func next() {
        curContext.setNextState(state: PlayerState(context: curContext))
        timer?.invalidate()
    }
    
    
    @objc private func finish() {
        let finishState = GameFinishState(context: curContext)
        curContext.setNextState(state: finishState)
        timer?.invalidate()
    }
}
