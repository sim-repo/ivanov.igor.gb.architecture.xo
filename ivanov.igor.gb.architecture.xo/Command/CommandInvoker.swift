//
//  CommandInvoker.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 15.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation


class CommandInvoker {
    lazy var commands: [CommandProtocol] = []
    
    public func add(command: CommandProtocol) {
        commands.append(command)
    }
    
    public func execNow(command: CommandProtocol) {
        command.exec()
    }
    
    public func execAll() {
        commands.forEach {
            $0.exec()
        }
    }
}
