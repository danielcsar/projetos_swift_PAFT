//
//  TimerViewController.swift
//  TimeEggs
//
//  Created by Aluno on 10/09/22.
//

import UIKit
import AVFoundation

class TimerViewController: UIViewController, UIAlertViewDelegate {

    var audio: AVPlayer!
    @IBOutlet weak var eggTitle: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var eggDescription: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var eggTime = 0
    var eggName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eggTitle.text = eggName
        eggDescription.text = "Tempo para cozimento: \(eggTime) minutos"
        timerLabel.text = String(eggTime)
        progressBar.progress = 0.0
        progressBar.isHidden = true
    }
    
    private func playAlarm() {
        AudioServicesPlaySystemSound(1016)
    }
    
    private func chronometer(_ time: Int){
        var timeLeft = time
        progressBar.isHidden = false
        var progressValue: Float = 0.0
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer_ in
            timeLeft -= 1
            progressValue += 1 / Float(time)
            
            self.progressBar.setProgress(progressValue, animated: true)
            self.timerLabel.text = String(timeLeft)
                
            if(timeLeft == 0){
                self.playAlarm()
                let alert = UIAlertController(title: "Pronto!", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    self.timerLabel.text = ""
                }))
                self.present(alert, animated: true, completion: nil)
                timer_.invalidate()
                
                //self.timerLabel.text = "Pronto!"
                //self.timerLabel.textColor = UIColor.init(red: 255/255, green: 159/255, blue: 41/255, alpha: 1.0)
            }
        }
    }
    
    @objc @IBAction func startTimer(_ sender: UIButton) {
        chronometer(eggTime)
    }
}
