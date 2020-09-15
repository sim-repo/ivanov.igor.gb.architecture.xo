//
//  LogCommand.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 15.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation
 

class LogCommand: CommandProtocol {
    
    let playerEnum: PlayerEnum
    let location: Move
    
    init(playerEnum: PlayerEnum, location: Move){
        self.playerEnum = playerEnum
        self.location = location
    }
    
    public func exec() {
        let log = Log(player: playerEnum, location: location)
        logs.append(log)
    }
}
