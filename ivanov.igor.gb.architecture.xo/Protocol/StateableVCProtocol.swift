//
//  StateableViewController.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 14.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

protocol StateableVCProtocol {
    func refreshBoard(positions: [PlayerEnum])
    func finish(finishEnum: FinishEnum, lastPlayer: PlayerEnum)
}
