//
//  Stra.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 14.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

protocol GameStrategyProtocol {
    init(context: GameStrategySelector)
    func getNextPlayer(_ lastPlayer: PlayerEnum) -> PlayerEnum
    func getNextStateClass(_ lastOpponentEnum: OpponentEnum) -> GameStateProtocol.Type
}
