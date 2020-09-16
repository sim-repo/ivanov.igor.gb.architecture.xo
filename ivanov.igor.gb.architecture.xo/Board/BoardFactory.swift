//
//  BoardFactory.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 16.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation


final class BoardFactory {

    public func create(gameModeEnum: GameModeEnum) -> BoardProtocol {
        switch gameModeEnum {
            case .versusComputer:
                return Board()
            case .versusHuman:
                return Board()
            case .blindly:
                return BlindlyBoardDecorator(wrappedBoard: Board())
        }
    }
}
