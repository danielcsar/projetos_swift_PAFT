//
//  QuizViewController.swift
//  Quiz
//
//  Created by Aluno on 12/09/22.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    var points: Int = 0
    var questions = QuestionsList.instance.list
    var counter: Int = 0
    var limit: Int = 0
    var question: Question?
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Quiz"
        button1.isHidden = false
        button2.isHidden = false
        button3.isHidden = false
        limit = questions.count - 1
        refreshText()
    }
    
    private func showQuestion(){
        if counter < limit {
            question = QuestionsList.instance.list[counter]
            questionLabel.text = question?.question
            button1.setTitle(question!.answer1.keys.first, for: .normal)
            button2.setTitle(question!.answer2.keys.first, for: .normal)
            button3.setTitle(question!.answer3.keys.first, for: .normal)
        } else {
            questionLabel.text = "Parabéns!"
            questionLabel.textColor = UIColor(red: 0xFF, green: 0xFF, blue: 0xFF, alpha: 0xFF)
            view.backgroundColor = UIColor(red: 114/255, green: 58/255, blue: 251/255, alpha: 1)
            score.textColor = UIColor(red: 0xFF, green: 0xFF, blue: 0xFF, alpha: 0xFF)
            button1.isHidden = true
            button2.isHidden = true
            button3.isHidden = true
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer_ in
                self.navigationController?.popViewController(animated: true)
            }
        }
        counter += 1
    }
    
    func refreshText(){
        limit = questions.count
        score.text = String(points)
        showQuestion()
    }
    
    @IBAction func press1(_ sender: UIButton) {
        if question!.answer1.values.first == true {
            points += 1
        }
        refreshText()
    }
    
    @IBAction func press2(_ sender: UIButton) {
        if question!.answer2.values.first == true {
            points += 1
        }
        refreshText()
    }
    
    @IBAction func press3(_ sender: UIButton) {
        if question!.answer3.values.first == true {
            points += 1
        }
        refreshText()
    }
}
