//
//  VersusHumanStrategy.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 14.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class VersusHumanStrategy: GameStrategyProtocol {
    
    required init(context: GameStrategySelector){
        let beginningState = PlayerState(context: context, lastPlayer: .X)
        context.setNextState(state: beginningState)
    }
    
    func getNextPlayer(_ lastPlayer: PlayerEnum) -> PlayerEnum {
        return lastPlayer.getNextPlayer()
    }
    
    func getStateClass(_ lastOpponentEnum: OpponentEnum) -> GameStateProtocol.Type {
        return PlayerState.self
    }
}
