//
//  Log.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 15.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

var logs: [Log] = []

struct Log {
    let player: PlayerEnum
    let location: Move
}
