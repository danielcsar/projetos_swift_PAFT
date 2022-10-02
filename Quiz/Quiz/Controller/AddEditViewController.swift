//
//  AddViewController.swift
//  Quiz
//
//  Created by Aluno on 16/09/22.
//

import UIKit

class AddEditViewController: UIViewController {
    
    var questions = QuestionsList.instance
    var newQuestion: Question?
    var index: Int = 0
    var question: String = ""
    var answer1: [String: Bool] = ["": false]
    var answer2: [String: Bool] = ["": false]
    var answer3: [String: Bool] = ["": false]
    var isNewQuestion: Bool = false
    
    @IBOutlet weak var questionField: UITextField!
    
    @IBOutlet weak var answer1Label: UITextField!
    
    @IBOutlet weak var answer2Label: UITextField!
    
    @IBOutlet weak var answer3Label: UITextField!
    
    @IBOutlet weak var switch1: UISwitch!
    
    @IBOutlet weak var switch2: UISwitch!
    
    @IBOutlet weak var switch3: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Inserir/Editar Questão"
        questionField.text = question
        answer1Label.text = answer1.keys.first
        answer2Label.text = answer2.keys.first
        answer3Label.text = answer3.keys.first
        switch1.isOn = answer1.values.first!
        switch2.isOn = answer2.values.first!
        switch3.isOn = answer3.values.first!
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        newQuestion = Question(question: questionField.text ?? "", answer1: [answer1Label.text ?? "": switch1.isOn], answer2: [answer2Label.text ?? "": switch2.isOn], answer3: [answer3Label.text ?? "": switch3.isOn])
        
        if isNewQuestion {
            questions.list.append(newQuestion!)
        } else {
            questions.list[index] = newQuestion!
        }
        self.navigationController?.popViewController(animated: true)
    }
}
