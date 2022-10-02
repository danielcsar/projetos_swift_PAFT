//
//  QuestionsList.swift
//  Quiz
//
//  Created by Daniel on 15/09/22.
//

import Foundation

class QuestionsList {
    
    static let instance = QuestionsList()
    
    init() {
    }
    
    var list: [Question] = [
        Question(question: "Qual destes passwords foi o mais usado na internet?", answer1: ["a1b2c3": false], answer2: ["abcdef": false], answer3: ["123456": true]),
        Question(question: "O que significa a sigla “www” na internet?", answer1: ["World Wide Web": true], answer2: ["Web world wide": false], answer3: ["Web wide world": false]),
        Question(question: "Qual foi o primeiro tweet da história?", answer1: ["Olá, twitter": false], answer2: ["Olá, mundo": false], answer3: ["Estou preparando meu twitter": true]),
        Question(question: "Qual foi a duração do primeiro vídeo do Youtube?", answer1: ["3 minutos": false], answer2: ["1 minuto": false], answer3: ["18 segundos": true]),
        Question(question: "Em média, quantas pesquisas totalmente novas são feitas no Google por dia?", answer1: ["450 milhões": true], answer2: ["1 bilhão": false], answer3: ["280 milhões": false]),
        Question(question: "Qual foi a primeira rede social da história da internet?", answer1: ["Classmate": true], answer2: ["MySpace": false], answer3: ["Orkut": false]),
        Question(question: "Quando foi criado o primeiro smartphone da história?", answer1: ["1994": true], answer2: ["2000": false], answer3: ["1998": false]),
        Question(question: "Qual o nome do ataque cibernético que atingiu computadores no mundo todo este ano?", answer1: ["WannaSpy": false], answer2: ["WannaFly": false], answer3: ["WannaCry": true]),
        Question(question: "Qual a resolução de uma imagem Full HD?", answer1: ["1920 x 1080": true], answer2: ["1280 x 720": false], answer3: ["2560 x 1440": false]),
        Question(question: "Quantos bits cabem em um byte?", answer1: ["8 bits": true], answer2: ["1 bit": false], answer3: ["12 bits": false])
    ]
    
    func removeQuestionByIndex(_ pos: Int){
        list.remove(at: pos)
    }
}
