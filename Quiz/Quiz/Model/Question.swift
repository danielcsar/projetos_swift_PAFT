//
//  QuestionsDAO.swift
//  Quiz
//
//  Created by Aluno on 12/09/22.
//

import Foundation

struct Question{
    
    //Properties
    var question: String
    var answer1: [String: Bool]
    var answer2: [String: Bool]
    var answer3: [String: Bool]
    
    init(question: String, answer1: [String : Bool], answer2: [String : Bool], answer3: [String : Bool]) {
        self.question = question
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
    }
}
