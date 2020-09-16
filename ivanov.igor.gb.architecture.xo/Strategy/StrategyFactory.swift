//
//  StrategyFactory.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 16.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

final class StrategyFactory {

    public func create(gameModeEnum: GameModeEnum, gameSession: GameSession) -> GameStrategyProtocol {
        switch gameModeEnum {
            case .versusComputer:
                return VersusComputerStrategy(context: gameSession)
            case .versusHuman:
                return VersusHumanStrategy(context: gameSession)
            case .blindly:
                return BlindlyStrategy(context: gameSession)
        }
    }
}
