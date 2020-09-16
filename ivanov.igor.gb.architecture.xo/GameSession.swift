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
    
    
    public func setup(gameModeEnum: GameModeEnum,
                      strategyFactory: StrategyFactory,
                      boardFactory: BoardFactory,
                      vc: ViewControllerDelegate) {
        self.vc = vc

        strategy = strategyFactory.create(gameModeEnum: gameModeEnum, gameSession: self)
        board = boardFactory.create(gameModeEnum: gameModeEnum)
        switch gameModeEnum {
            case .versusComputer:
              //  board = Board()
            break
            case .versusHuman:
                //board = Board()
            break
            case .blindly:
                //board = BoardBlindly()
                board.changePlayer(player: .X)
                commandInvoker = CommandInvoker()
                backupOperation(operation: board)
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
        commandInvoker?.add(command: LogCommand(playerEnum: curPlayer, location: location))
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
    
    public func tryChangePlayer() {
        let player = strategy.getNextPlayer(board.getPlayer())
        board.changePlayer(player: player)
    }
    
    public func didPressUndo() {
        if let invoker = commandInvoker {
            invoker.execNow(command: UndoCommand(context: self))
            return
        }
    }
    
    public func undo(board: BoardProtocol) {
        self.board = board
        updateBoardView() 
    }
}
