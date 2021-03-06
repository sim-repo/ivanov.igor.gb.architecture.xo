//
//  GameStateProtocol.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 13.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import UIKit


protocol GameStateProtocol {
    init(context: GameSession)
    func addMark(at location: Int)
}
