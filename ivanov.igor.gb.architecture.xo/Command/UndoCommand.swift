//
//  UndoCommand.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 15.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class UndoCommand: CommandProtocol {
    
    let context: GameSession
    
    init(context: GameSession){
        self.context = context
    }
    
    public func exec() {
        guard var board = transactionEntries.popLast(),
              let _ = logs.popLast()
        else { return }
        
        if transactionEntries.count > 0 {
            board = transactionEntries.last!
        }
        
        guard let copyable = board as? Copyable else { return }
        let copy = copyable.copy()
        context.undo(board: copy as! BoardProtocol)
    }
}
