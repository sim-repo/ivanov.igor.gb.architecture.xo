//
//  UndoCommand.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 15.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class UndoCommand: CommandProtocol {
    
    let context: GameStrategySelector
    
    init(context: GameStrategySelector){
        self.context = context
    }
    
    public func exec() {
        guard let board = transactionEntries.popLast() else { return }
        if transactionEntries.count > 0 {
            guard let board2 = transactionEntries.last else { return }
            context.undo(board: board2)
        } else {
            context.undo(board: board)
        }
    }
}
