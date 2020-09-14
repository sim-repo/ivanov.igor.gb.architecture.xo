//
//  AiAlgorithm.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 13.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation


// Find the best possible outcome for originalPlayer
func minimax(_ board: Board, maximizing: Bool, originalPlayer: PlayerEnum) -> Int {
    // Base case — evaluate the position if it is a win or a draw
    if board.checkWin() != .none && originalPlayer == board.player.opposite { return 1 } // win
    else if board.checkWin() != .none && originalPlayer != board.player.opposite { return -1 } // loss
    else if board.isDraw { return 0 } // draw
 
    // Recursive case — maximize your gains or minimize the opponent's gains
    if maximizing {
        var bestEval = Int.min
        for move in board.legalMoves { // find the move with the highest evaluation
            let result = minimax(board.move(move), maximizing: false, originalPlayer: originalPlayer)
            bestEval = max(result, bestEval)
        }
        return bestEval
    } else { // minimizing
        var worstEval = Int.max
        for move in board.legalMoves {
            let result = minimax(board.move(move), maximizing: true, originalPlayer: originalPlayer)
            worstEval = min(result, worstEval)
        }
        return worstEval
    }
}


// Run minimax on every possible move to find the best one
func findBestMove(_ board: Board) -> Move {
    var bestEval = Int.min
    var bestMove = -1
    for move in board.legalMoves {
        let result = minimax(board.move(move), maximizing: false, originalPlayer: board.player)
        if result > bestEval {
            bestEval = result
            bestMove = move
        }
    }
    return bestMove
}
