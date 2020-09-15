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
    private(set) var board: Board!
    private(set) var curState: GameStateProtocol!
    private weak var vc: ViewController!
    private var commandInvoker: CommandInvoker?
    
    
    func setup(gameModeEnum: GameModeEnum, vc: ViewController) {
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
                board.changePlayer(player: .X)
                commandInvoker = CommandInvoker()
        }
    }
    
    
    private func canMark(at location: Int) -> Bool {
        return board.canMark(location)
    }
    
    public func didPressMark(at location: Int) {
        if canMark(at: location) {
            curState.addMark(at: location)
        }
    }
    
    public func log(_ location: Move){
        let curPlayer = board.player
        commandInvoker?.add(command: LogCommand(playerEnum: curPlayer, location: location))
    }
    
    public func isFinish() -> Bool {
        return board.checkWin() != .none || board.isDraw
    }
    
    public func doFinish() {
        if let invoker = commandInvoker {
            invoker.add(command: ReplayCommand(receiver: vc, context: self))
            invoker.execAll()
            return
        }
        vc.finish(finishEnum: board.getFinish(), lastPlayer: board.getWinner())
    }
    
    public func updateBoardView() {
        vc.refreshBoard(positions: board.getPositions())
    }
    
    public func setNextState(state: GameStateProtocol) {
        self.curState = state
    }
    
    public func getStateClass(_ lastOpponentEnum: OpponentEnum) -> GameStateProtocol.Type {
        return strategy.getNextStateClass(lastOpponentEnum)
    }
    
    func tryChangePlayer() {
        let player = strategy.getNextPlayer(board.player)
        board.changePlayer(player: player)
    }
}
