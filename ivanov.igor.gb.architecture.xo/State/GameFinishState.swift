//
//  GameFinishState.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 14.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class GameFinishState: GameStateProtocol {
    
    private unowned var context: GameStrategySelector?
    private var curContext: GameStrategySelector {
        guard let context = context else { fatalError("") }
        return context
    }
    var lastPlayer: PlayerEnum!

    required init(context: GameStrategySelector, lastPlayer: PlayerEnum) {
        self.context = context
        self.lastPlayer = lastPlayer
        finish()
    }
    
    func addMark(at location: Int) {
        print("AiState: addMark(): can't handle.")
    }
    
    private func finish() {
        curContext.doFinish(lastPlayer: lastPlayer)
    }
}
