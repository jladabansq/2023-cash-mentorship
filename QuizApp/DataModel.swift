//
//  DataModel.swift
//  QuizApp
//
//  Created by Jane Ladaban on 6/20/23.
//

import UIKit

struct QuestionData: Hashable, Identifiable {
    var id: Int
    var question: String
    var choices: [String]
    var answer: String
    var isAnswered: Bool
    var isCorrect: Bool
}

class DataModel: NSObject {
    static let data: [QuestionData] = [
        QuestionData(id: 1, question: "What is the capital of New York state?", choices: ["New York City", "Albany", "Queens"], answer: "Albany", isAnswered: false, isCorrect: false),
        QuestionData(id: 2, question: "Is Washington, DC a state?", choices: ["Yes", "No"], answer: "No", isAnswered: false, isCorrect: false)
    ]
    
    static let testData: [QuestionData] = [
        QuestionData(id: 0, question: "Do you think this is a test?", choices: ["Yes", "No", "Maybe"], answer: "Maybe", isAnswered: false, isCorrect: false),
        QuestionData(id: 99, question: "Is this a real question?", choices: ["Yes", "No", "Maybe"], answer: "No", isAnswered: false, isCorrect: false),
    ]
}

var score = 0

func incrementScore() {
    score += 1;
}
