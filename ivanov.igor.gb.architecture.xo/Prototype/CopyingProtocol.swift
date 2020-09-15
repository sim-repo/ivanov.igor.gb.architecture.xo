//
//  CopyingProtocol.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 15.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

protocol CopyingProtocol {
    init(_ prototype: Self)
}

extension CopyingProtocol {
    func copy() -> Self {
        return Self.init(self)
    }
}


