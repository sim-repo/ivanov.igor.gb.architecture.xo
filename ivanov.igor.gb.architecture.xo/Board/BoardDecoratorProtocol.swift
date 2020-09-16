//
//  BoardDecorator.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 16.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

protocol BoardDecoratorProtocol: BoardProtocol {
    init(wrappedBoard: DecorableBoardProtocol)
}
