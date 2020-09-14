//
//  VersusComputerStrategy.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 14.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class VersusComputerStrategy: GameStrategyProtocol {
    
    required init(context: GameStrategySelector){
        let beginningState = PlayerState(context: context, lastPlayer: .X)
        context.setNextState(state: beginningState)
    }
    
    func getNextPlayer(_ lastPlayer: PlayerEnum) -> PlayerEnum {
        return lastPlayer.getNextPlayer()
    }
    
    
    func getStateClass(_ lastOpponentEnum: OpponentEnum) -> GameStateProtocol.Type {
        switch lastOpponentEnum {
            case .computer:
                return PlayerState.self
            case .human:
                return AiState.self
        }
    }
}
