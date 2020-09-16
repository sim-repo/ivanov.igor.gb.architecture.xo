//
//  AiAlgorithm.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 13.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation


func minimax(_ board: Board, maximizing: Bool, originalPlayer: PlayerEnum) -> Int {
    if board.checkWin() != .none && originalPlayer == board.player.opposite { return 1 } // win
    else if board.checkWin() != .none && originalPlayer != board.player.opposite { return -1 } // loss
    else if board.isDraw { return 0 } // draw
 
    if maximizing {
        var bestEval = Int.min
        for move in board.legalMoves {
            let result = minimax(board.move(move), maximizing: false, originalPlayer: originalPlayer)
            bestEval = max(result, bestEval)
        }
        return bestEval
    } else {
        var worstEval = Int.max
        for move in board.legalMoves {
            let result = minimax(board.move(move), maximizing: true, originalPlayer: originalPlayer)
            worstEval = min(result, worstEval)
        }
        return worstEval
    }
}


func findBestMove(_ board: BoardProtocol) -> Move {
    var bestEval = Int.min
    var bestMove = -1
    for move in board.legalMoves {
        let result = minimax(board.move(move), maximizing: false, originalPlayer: board.getPlayer())
        if result > bestEval {
            bestEval = result
            bestMove = move
        }
    }
    return bestMove
}
