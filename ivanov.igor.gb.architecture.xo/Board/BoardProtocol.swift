//
//  BoardProtocol.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 16.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation


protocol BoardProtocol {
    
    var isDraw: Bool { get }
    var legalMoves: [Move] { get }
    func checkWin() -> FinishEnum
    func getWinner() -> PlayerEnum
    func move(_ location: Move) -> Board
    func getStep() -> Int
    func canMark(_ location: Move) -> Bool
    func addMark(at location: Move)
    func getFinish() -> FinishEnum
    func getPositions() -> [PlayerEnum]
    func changePlayer(player: PlayerEnum)
    func getPlayer() -> PlayerEnum
    func setStepNum(step: Int)
}


//инкапсулирует методы, которые дб скрыты извне кроме декораторов
protocol DecorableBoardProtocol: BoardProtocol {
    
    func getPositions() -> [PlayerEnum]
    func setPositions(_ positions: [PlayerEnum])
    func getLastMove() -> Move
}
