//
//  Board.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 13.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class Board: BoardProtocol {
    
    internal var positions: [PlayerEnum]
    internal var player: PlayerEnum = .E
    internal var lastMove: Move
    internal var stepNum: Int = 0
    
    public var legalMoves: [Move] {
        return positions.indices.filter { positions[$0] == .E }
    }
    
    public var isDraw: Bool {
        return checkWin() == .none && legalMoves.count == 0
    }
    
    init(positions: [PlayerEnum] = [.E, .E, .E, .E, .E, .E, .E, .E, .E], turn: PlayerEnum = .E, lastMove: Move = -1) {
        self.positions = positions
        self.player = turn
        self.lastMove = lastMove
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
    
    
    public func getWinner() -> PlayerEnum {
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
    
    
    public func move(_ location: Move) -> Board {
        var tempPosition = positions
        tempPosition[location] = player
        return Board(positions: tempPosition, turn: player.opposite, lastMove: location)
    }
    
    
    public func getStep() -> Int {
        return stepNum
    }
    
    
    public func canMark(_ location: Move) -> Bool {
        return legalMoves.contains(location)
    }
    
    
    public func addMark(at location: Move) {
        positions[location] = self.player
        self.lastMove = location
    }
    
    
    public func getFinish() -> FinishEnum {
        if isDraw {
            return .draw
        }
        return checkWin()
    }
    
    
    public func getPositions() -> [PlayerEnum] {
        return positions
    }
    
    public func changePlayer(player: PlayerEnum) {
        self.player = player
    }
}


// can access from decorators only
extension Board: DecorableBoardProtocol {
    func getPlayer() -> PlayerEnum {
        return player
    }
    
    func getLastMove() -> Move {
        return lastMove
    }
    
    func setStepNum(step: Int) {
        stepNum = step
    }
    
    func setPositions(_ positions: [PlayerEnum]) {
        self.positions = positions
    }
}
