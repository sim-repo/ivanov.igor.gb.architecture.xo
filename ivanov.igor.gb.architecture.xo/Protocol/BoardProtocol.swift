//
//  StateableBoardProtocol.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 15.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation


protocol StateableBoardProtocol {
    func changePlayer(player: PlayerEnum)
}

protocol StrategiableBoardProtocol {
    func getStep() -> Int
    func canMark(_ location: Move) -> Bool
    func addMark(at location: Move)
    func getFinish() -> FinishEnum
    func getPositions() -> [PlayerEnum]
}
