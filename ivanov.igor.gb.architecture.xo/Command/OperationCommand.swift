//
//  OperationCommand.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 15.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class OperationCommand: CommandProtocol {
    
    let board: BoardBlindly
    
    init(board: BoardBlindly){
        self.board = board.copy()
    }
    
    public func exec() {
        transactionEntries.append(board)
    }
}
