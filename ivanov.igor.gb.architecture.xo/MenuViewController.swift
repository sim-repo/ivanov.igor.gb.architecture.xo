//
//  MenuViewController.swift
//  ivanov.igor.gb.architecture.xo
//
//  Created by Igor Ivanov on 14.09.2020.
//  Copyright © 2020 Igor Ivanov. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressVersusComputer(_ sender: Any) {
        performSegue(withIdentifier: "segueGame", sender: GameModeEnum.versusComputer)
    }
    
    @IBAction func pressVersusHuman(_ sender: Any) {
        performSegue(withIdentifier: "segueGame", sender: GameModeEnum.versusHuman)
    }
    
    @IBAction func pressBlindly(_ sender: Any) {
        performSegue(withIdentifier: "segueGame", sender: GameModeEnum.blindly)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mode = sender as? GameModeEnum,
              let dest = segue.destination as? ViewController
        else { return }
        dest.setup(gameModeEnum: mode)
    }
}
