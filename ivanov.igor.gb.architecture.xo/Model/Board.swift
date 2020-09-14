//
//  Board.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 13.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class Board {
    internal var positions: [PlayerEnum]
    var player: PlayerEnum
    var lastMove: Move
    var stepNum: Int = 0
    
    
    init(positions: [PlayerEnum] = [.E, .E, .E, .E, .E, .E, .E, .E, .E], turn: PlayerEnum = .X, lastMove: Move = -1) {
        self.positions = positions
        self.player = turn
        self.lastMove = lastMove
    }
    
    
    // the legal moves in a position are all of the empty squares
    var legalMoves: [Move] {
        return positions.indices.filter { positions[$0] == .E }
    }
    
    
    public func checkWin() -> FinishEnum {
        if positions[0] == positions[3] && positions[0] == positions[6] && positions[0] != .E {
            return .col0
        }
        
        if  positions[1] == positions[4] && positions[1] == positions[7] && positions[1] != .E {
            return .col1
        }
        
        if  positions[2] == positions[5] && positions[2] == positions[8] && positions[2] != .E {
            return .col2
        }
        
        if  positions[0] == positions[1] && positions[0] == positions[2] && positions[0] != .E {
            return .row0
        }
        
        if  positions[3] == positions[4] && positions[3] == positions[5] && positions[3] != .E {
            return .row1
        }
        
        if  positions[6] == positions[7] && positions[6] == positions[8] && positions[6] != .E {
            return .row2
        }
        
        if  positions[0] == positions[4] && positions[0] == positions[8] && positions[0] != .E  {
            return .leftDiag
        }
        
        if  positions[2] == positions[4] && positions[2] == positions[6] && positions[2] != .E  {
            return .rightDiag
        }
        return .none
    }
    
    
    func getWinner() -> PlayerEnum {
        let win = checkWin()
        if win != .none {
            switch win {
            case .col0, .row0, .leftDiag:
                return positions[0]
            case .col1:
                return positions[1]
            case .col2, .rightDiag:
                return positions[2]
            case .row1:
                return positions[3]
            case .row2:
                return positions[6]
            default:
                break
            }
        }
        return .E
    }
    
    var isDraw: Bool {
        return checkWin() == .none && legalMoves.count == 0
    }
    
    public func getFinish() -> FinishEnum {
        if isDraw {
            return .draw
        }
        return checkWin()
    }
    
    // location can be 0-8, indicating where to move
    // return a new board with the move played
    func move(_ location: Move) -> Board {
        var tempPosition = positions
        tempPosition[location] = player
        return Board(positions: tempPosition, turn: player.opposite, lastMove: location)
    }
    
    func addMark(at location: Move) {
        positions[location] = self.player
        self.lastMove = location
    }
    
    func setPlayer(player: PlayerEnum) {
        self.player = player
    }

    func canMark(_ location: Move) -> Bool {
        return legalMoves.contains(location)
    }
    
    func getPositions() -> [PlayerEnum] {
        return positions
    }

    func getStep() -> Int {
        return stepNum
    }
}
