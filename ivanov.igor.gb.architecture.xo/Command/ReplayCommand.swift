//
//  Command.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 15.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import Foundation

class ReplayCommand: CommandProtocol {
    weak var context: GameSession?
    weak var receiver: ViewControllerDelegate?
    private var timer: Timer?
    
    private var tracking: [Log] = []
    private var positions: [PlayerEnum] = [.E, .E, .E, .E, .E, .E, .E, .E, .E]
    private var idxX: Int = -1
    private var idxY: Int = -1
    private var player: PlayerEnum = .O
    
    init(receiver: ViewControllerDelegate, context: GameSession) {
        self.receiver = receiver
        self.context = context
    }
    
    
    func exec() {
        for i in stride(from: 0, through: 4, by: 1) {
            tracking.append(logs[i])
            for j in stride(from: 5+i, through: 5+i, by: 1) {
                tracking.append(logs[j])
            }
        }
       
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.redrawBoard), userInfo: nil, repeats: true)
    }
    
    
    @objc func redrawBoard() {
        
        if idxY >= 10 || idxY >= 10 {
            timer?.invalidate()
             receiver?.finish(finishEnum: context!.board.getFinish(), lastPlayer: context!.board.getWinner())
            return
        }
            
        player = player == .X ? .O : .X
        var didPlace = false
        
        while !didPlace {
            var idx = 0
            switch player {
                case .X:
                    idxX += 1
                    idx = idxX
                default:
                    idxY += 1
                    idx = idxY
            }
            if idx >= tracking.count - 1 {
                didPlace = true
                break
            }
            let log = tracking[idx]
            if log.player == player,
                positions[log.location] == .E {
                positions[log.location] = log.player
                context?.board.changePlayer(player: player)
                context?.board.addMark(at: log.location)
                receiver?.refreshBoard(positions: positions)
                didPlace = true
            }
        }
        
    }
}
