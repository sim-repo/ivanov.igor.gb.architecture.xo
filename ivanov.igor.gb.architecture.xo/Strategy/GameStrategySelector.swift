//
//  GameStrategySelector.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 14.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation


class GameStrategySelector {
    
    private(set) var strategy: GameStrategyProtocol!
    
    private var gameModeEnum: GameModeEnum!
    
    private(set) var board: Board!
    
    private(set) var curState: GameStateProtocol!
    weak var vc: ViewController?
    
    func setup(gameModeEnum: GameModeEnum, vc: ViewController) {
        self.gameModeEnum = gameModeEnum
        self.vc = vc
        
        switch gameModeEnum {
            case .versusComputer:
                strategy = VersusComputerStrategy(context: self)
                board = Board()
            case .versusHuman:
                strategy = VersusHumanStrategy(context: self)
                board = Board()
            case .blindly:
                strategy = BlindlyStrategy(context: self)
                board = BoardBlindly()
        }
    }
    
    
    func canMark(at location: Int) -> Bool {
        return board.canMark(location)
    }
    
    func didPressMark(at location: Int) {
        if canMark(at: location) {
            curState.addMark(at: location)
        }
    }
    
    func getStep() -> Int {
        return board.getStep()
    }
    
    func isFinish() -> Bool {
        return board.checkWin() != .none || board.isDraw
    }
    
    func doFinish(lastPlayer: PlayerEnum) {
        vc?.finish(finishEnum: board.getFinish(), lastPlayer: lastPlayer)
    }
    
    func updateBoardView() {
        vc?.refreshBoard(positions: board.getPositions())
    }
    
    func setNextState(state: GameStateProtocol) {
        self.curState = state
    }
    
    func getStateClass(_ lastOpponentEnum: OpponentEnum) -> GameStateProtocol.Type {
        return strategy.getStateClass(lastOpponentEnum)
    }
    
    
    func getNextPlayer(lastPlayer: PlayerEnum) -> PlayerEnum {
        return strategy.getNextPlayer(lastPlayer)
    }
}
