//
//  GameStrategySelector.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 14.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation


final class GameSession {
    
    private(set) var strategy: GameStrategyProtocol!
    private(set) var board: BoardProtocol!
    private(set) var curState: GameStateProtocol!
    private(set) weak var vc: ViewControllerDelegate!
    private(set) var commandInvoker: CommandInvoker?
    
    public func setup(strategyFactory: StrategyFactory,
                      boardFactory: BoardFactory,
                      vc: ViewControllerDelegate) {
        self.vc = vc
        
        strategy = strategyFactory.create(gameModeEnum: vc.getGameMode(), gameSession: self)
        board = boardFactory.create(gameModeEnum: vc.getGameMode())
        commandInvoker = CommandInvoker()
        backupOperation(operation: board)
        switch vc.getGameMode() {
            case .versusComputer:
            break
            case .versusHuman:
            break
            case .blindly:
                board.changePlayer(player: .X)
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
    
    public func logOperation(_ location: Move){
        let curPlayer = board.getPlayer()
        commandInvoker?.execNow(command: LogCommand(playerEnum: curPlayer, location: location))
        backupOperation(operation: board)
    }
    
    private func backupOperation(operation: BoardProtocol) {
        guard let copyable = operation as? Copyable else { return }
        commandInvoker?.execNow(command: OperationCommand(board: copyable))
    }
    
    
    public func isFinish() -> Bool {
        return board.checkWin() != .none || board.isDraw
    }
    
    public func doFinish() {
        if vc.getGameMode() == .blindly,
           let invoker = commandInvoker {
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
    
    public func tryChangePlayer() {
        let player = strategy.getNextPlayer(board.getPlayer())
        board.changePlayer(player: player)
    }
    
    public func didPressUndo() {
        if let invoker = commandInvoker {
            board.setStepNum(step: board.getStep()-1)
            invoker.execNow(command: UndoCommand(context: self))
            return
        }
    }
    
    public func undo(board: BoardProtocol) {
        self.board = board
        updateBoardView()
    }
}
