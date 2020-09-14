//
//  BoardView.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 13.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import UIKit


class BoardView: UIView {
    
    private var pos0: String = ""
    private var pos1: String = ""
    private var pos2: String = ""
    private var pos3: String = ""
    private var pos4: String = ""
    private var pos5: String = ""
    private var pos6: String = ""
    private var pos7: String = ""
    private var pos8: String = ""
    private var winLineNo: CGFloat = -1
    private var winMsg: String = ""
    
    override func draw(_ rect: CGRect) {
        
        BoardCG.drawBoardView(frame: bounds,
                              resizing: .aspectFit,
                              pos0: pos0,
                              pos1: pos1,
                              pos2: pos2,
                              pos3: pos3,
                              pos4: pos4,
                              pos5: pos5,
                              pos6: pos6,
                              pos7: pos7,
                              pos8: pos8,
                              winLineNo: winLineNo,
                              winMsg: winMsg)
    }
    
    
    public func setup(positions: [PlayerEnum]) {
        pos0 = positions[0].rawValue
        pos1 = positions[1].rawValue
        pos2 = positions[2].rawValue
        pos3 = positions[3].rawValue
        pos4 = positions[4].rawValue
        pos5 = positions[5].rawValue
        pos6 = positions[6].rawValue
        pos7 = positions[7].rawValue
        pos8 = positions[8].rawValue
        setNeedsDisplay()
    }
    
    public func finish(winEnum: FinishEnum, playerEnum: PlayerEnum) {
        winLineNo = CGFloat(winEnum.rawValue)
        if winEnum != .draw {
            winMsg = "Победитель: \(playerEnum.rawValue)"
        }
        print(winLineNo)
        setNeedsDisplay()
    }
}
