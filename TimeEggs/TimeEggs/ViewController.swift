//
//  ViewController.swift
//  TimeEggs
//
//  Created by Aluno on 09/09/22.
//

import UIKit

class ViewController: UIViewController {

    var eggs = [2: "Líquido", 4: "Líquido-Mole", 6: "Mole", 8: "Médio", 10: "Médio-Duro", 15: "Duro"]
    var time = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getTags(_ sender: UIButton) {
        if eggs.keys.contains(Int(sender.tag)){
            time = Int(sender.tag)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let timerController: TimerViewController = segue.destination as! TimerViewController
        
        timerController.eggTime = time
        timerController.eggName = eggs[time]!
    }
}
