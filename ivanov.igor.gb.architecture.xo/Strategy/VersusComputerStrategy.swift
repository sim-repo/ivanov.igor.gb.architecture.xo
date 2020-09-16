//
//  VersusComputerStrategy.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 14.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class VersusComputerStrategy: GameStrategyProtocol {
    
    required init(context: GameSession){
        let beginningState = PlayerState(context: context)
        context.setNextState(state: beginningState)
    }
    
    func getNextPlayer(_ lastPlayer: PlayerEnum) -> PlayerEnum {
        return lastPlayer.getNextPlayer()
    }
    
    
    func getNextStateClass(_ lastOpponentEnum: OpponentEnum) -> GameStateProtocol.Type {
        switch lastOpponentEnum {
            case .computer:
                return PlayerState.self
            case .human:
                return AiState.self
        }
    }
}
