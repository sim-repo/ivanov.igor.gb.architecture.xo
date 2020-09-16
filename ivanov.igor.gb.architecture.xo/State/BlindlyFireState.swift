//
//  BlindlyFireState.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 14.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class BlindlyFireState: GameStateProtocol {
    
    required init(context: GameSession) {
        context.doFinish()
    }
    
    func addMark(at location: Int) {
        print("AiState: addMark(): can't handle.")
    }
}
