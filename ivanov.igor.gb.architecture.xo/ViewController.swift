//
//  ViewController.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 13.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var boardView: BoardView!
    
  //  private let board = Board()
    private var strategySelector: GameStrategySelector?
    private var timer: Timer?
    private var stepNum: Int = 1
    
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
    }
    
    private func setupOutlets() {
        self.view.isMultipleTouchEnabled = false
        self.view.isExclusiveTouch = true
        button0.isExclusiveTouch = true
        button1.isExclusiveTouch = true
        button2.isExclusiveTouch = true
        button3.isExclusiveTouch = true
        button4.isExclusiveTouch = true
        button5.isExclusiveTouch = true
        button6.isExclusiveTouch = true
        button7.isExclusiveTouch = true
        button8.isExclusiveTouch = true
    }
    
    func setup(gameModeEnum: GameModeEnum){
        self.strategySelector = GameStrategySelector()
        self.strategySelector?.setup(gameModeEnum: gameModeEnum, vc: self)
    }
    
    func getStateStrategy() -> GameStrategySelector {
        guard let selector = strategySelector else {
            //TODO: throw err
            fatalError("ViewController: getStateStrategy() - strategySelector is nil")
        }
        return selector
    }
    
    @IBAction func pressUndo(_ sender: Any) {
         getStateStrategy().didPressUndo()
    }
    
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK:- Stateable
extension ViewController: StateableVCProtocol {
    
    func finish(finishEnum: FinishEnum, lastPlayer: PlayerEnum) {
        boardView.finish(winEnum: finishEnum, playerEnum: lastPlayer)
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.back), userInfo: nil, repeats: false)
    }

    func refreshBoard(positions: [PlayerEnum]){
        boardView.setup(positions: positions)
    }
}


//MARK:- button actions
extension ViewController {
    
    @IBAction func pressCell0(_ sender: Any) {
        getStateStrategy().didPressMark(at: 0)
    }
    
    @IBAction func pressCell1(_ sender: Any) {
        getStateStrategy().didPressMark(at: 1)
    }
    
    @IBAction func pressCell2(_ sender: Any) {
        getStateStrategy().didPressMark(at: 2)
    }
    
    @IBAction func pressCell3(_ sender: Any) {
        getStateStrategy().didPressMark(at: 3)
    }
    
    @IBAction func pressCell4(_ sender: Any) {
        getStateStrategy().didPressMark(at: 4)
    }
    
    @IBAction func pressCell5(_ sender: Any) {
        getStateStrategy().didPressMark(at: 5)
    }
    
    @IBAction func pressCell6(_ sender: Any) {
        getStateStrategy().didPressMark(at: 6)
    }
    
    @IBAction func pressCell7(_ sender: Any) {
        getStateStrategy().didPressMark(at: 7)
    }
    
    @IBAction func pressCell8(_ sender: Any) {
        getStateStrategy().didPressMark(at: 8)
    }
}
