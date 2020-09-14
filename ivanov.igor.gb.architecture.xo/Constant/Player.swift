//
//  Piece.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 13.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

enum PlayerEnum: String {
    case X = "X"
    case O = "O"
    case E = " "
    var opposite: PlayerEnum {
        switch self {
        case .X:
            return .O
        case .O:
            return .X
        case .E:
            return .E
        }
    }
}
