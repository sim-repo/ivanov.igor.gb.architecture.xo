//
//  BlindlyBoardDecorator.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 16.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation


class BlindlyBoardDecorator: BoardDecoratorProtocol, CopyingProtocol {
    
    private let wrappedBoard: DecorableBoardProtocol
    
    public var legalMoves: [Move] {
        return wrappedBoard.legalMoves
    }
    
    public var isDraw: Bool {
        return wrappedBoard.isDraw
    }
    
    // new states:
    private var firstPlayerPositions: [Move] = []
    private var secondPlayerPositions: [Move] = []
    
    
    required init(wrappedBoard: DecorableBoardProtocol) {
        self.wrappedBoard = wrappedBoard
    }
    
    required init(_ prototype: BlindlyBoardDecorator) {
       self.firstPlayerPositions = prototype.firstPlayerPositions
       self.secondPlayerPositions = prototype.secondPlayerPositions
       self.wrappedBoard = prototype.wrappedBoard
    }
    
    func checkWin() -> FinishEnum {
        return wrappedBoard.checkWin()
    }
    
    func getWinner() -> PlayerEnum {
        return wrappedBoard.getWinner()
    }
    
    func move(_ location: Move) -> Board {
        return wrappedBoard.move(location)
    }
    
    func getStep() -> Int {
        return wrappedBoard.getStep()
    }
    
    func setStepNum(step: Int) {
        wrappedBoard.setStepNum(step: step)
    }
    
    func canMark(_ location: Move) -> Bool {
        if wrappedBoard.getStep() < 5 {
            return !firstPlayerPositions.contains(location)
        } else {
            return !secondPlayerPositions.contains(location)
        }
    }
    
    func getPlayer() -> PlayerEnum {
        wrappedBoard.getPlayer()
    }
    
    func addMark(at location: Move) {
        let stepNum = wrappedBoard.getStep()
        wrappedBoard.setStepNum(step: stepNum + 1)
        switch wrappedBoard.getPlayer() {
            case .X:
               firstPlayerPositions.append(location)
            case .O:
               secondPlayerPositions.append(location)
            default:
               break
        }
        return wrappedBoard.addMark(at: location)
    }
    
    func getFinish() -> FinishEnum {
        return wrappedBoard.getFinish()
    }
    
    func getPositions() -> [PlayerEnum] {
        var positions: [PlayerEnum] = [.E, .E, .E, .E, .E, .E, .E, .E, .E]
        
        if wrappedBoard.getStep() <= 5 {
            for pos in firstPlayerPositions{
                positions[pos] = .X
            }
            return positions
        }
        
        if wrappedBoard.getStep() <= 9 {
            for pos in secondPlayerPositions{
                positions[pos] = .O
            }
            return positions
        }
        
        if wrappedBoard.getStep() == 10 {
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
        wrappedBoard.setPositions(positions)
        return positions
    }
    
    func changePlayer(player: PlayerEnum) {
        return wrappedBoard.changePlayer(player: player)
    }
}
