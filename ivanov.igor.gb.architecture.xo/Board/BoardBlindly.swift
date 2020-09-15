//
//  BoardBlindly.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 14.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation


class BoardBlindly: Board, CopyingProtocol {
    
    var firstPlayerPositions: [Move] = []
    var secondPlayerPositions: [Move] = []
    
    
    required init(_ prototype: BoardBlindly) {
        self.firstPlayerPositions = prototype.firstPlayerPositions
        self.secondPlayerPositions = prototype.secondPlayerPositions
        super.init()
        self.player = prototype.player
        self.lastMove = prototype.lastMove
        self.positions = prototype.positions
        self.stepNum = prototype.stepNum
    }
    
    override init(positions: [PlayerEnum] = [.E, .E, .E, .E, .E, .E, .E, .E, .E], turn: PlayerEnum = .E, lastMove: Move = -1) {
        super.init(positions: positions, turn: turn, lastMove: lastMove)
    }
    
    
    override func addMark(at location: Move) {
        stepNum += 1
        switch player {
        case .X:
            firstPlayerPositions.append(location)
        case .O:
            secondPlayerPositions.append(location)
        default:
            break
        }
    }
    
    
    override func canMark(_ location: Move) -> Bool {
        if stepNum < 5 {
            return !firstPlayerPositions.contains(location)
        } else {
            return !secondPlayerPositions.contains(location)
        }
    }
    
    
    
    override func getPositions() -> [PlayerEnum] {
        
        var positions: [PlayerEnum] = [.E, .E, .E, .E, .E, .E, .E, .E, .E]
        
        if stepNum <= 5 {
            for pos in firstPlayerPositions{
                positions[pos] = .X
            }
            return positions
        }
        
        if stepNum <= 9 {
            for pos in secondPlayerPositions{
                positions[pos] = .O
            }
            return positions
        }
        
        if stepNum == 10 {
            for pos in firstPlayerPositions{
                positions[pos] = .X
            }
            
            for (idx,pos) in secondPlayerPositions.enumerated() {
                if positions[pos] == .X {
                    if idx % 2 != 0 {
                        positions[pos] = .O
                    }
                } else {
                    positions[pos] = .O
                }
            }
        }
        self.positions = positions
        return positions
    }
}
