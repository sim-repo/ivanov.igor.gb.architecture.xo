//
//  BlindlyStrategy.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 14.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class BlindlyStrategy: GameStrategyProtocol {
    
    private unowned var context: GameStrategySelector?
    
    required init(context: GameStrategySelector){
        let beginningState = BlindlyPlaceState(context: context, lastPlayer: .X)
        self.context = context
        context.setNextState(state: beginningState)
    }
    
    
    func getNextPlayer(_ lastPlayer: PlayerEnum) -> PlayerEnum {
        guard let context = context else {
            fatalError("BlindlyStrategy: getPlayerEnum() context is nil")
        }
        if context.getStep() == 5 { //switch from .X to player .O
            return .O
        }
        return lastPlayer
    }
    
    func getStateClass(_ lastOpponentEnum: OpponentEnum) -> GameStateProtocol.Type {
        return PlayerState.self
    }
}
