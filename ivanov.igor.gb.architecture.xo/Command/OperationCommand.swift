//
//  OperationCommand.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 15.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class OperationCommand: CommandProtocol {
    
    let board: Copyable
    
    init(board: Copyable){
        self.board = board.copy()
    }
    
    public func exec() {
        guard let board = board as? BoardProtocol else { return }
        transactionEntries.append(board)
    }
}
