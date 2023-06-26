//
//  DataModel.swift
//  QuizApp
//
//  Created by Jane Ladaban on 6/20/23.
//

import UIKit

struct QuestionData: Hashable, Identifiable {
    var id: Int
    var headline: String
    var question: String
    var choices: [String]
    var answer: String
    var userAnswer: String = ""
    var explanation: String
    var isAnswered: Bool = false
    var isCorrect: Bool = false
}

class DataModel: NSObject {
    static let data: [QuestionData] = [
        QuestionData(id: 1, headline: "New York", question: "What is the capital of New York state?", choices: ["New York City", "Albany", "Queens"], answer: "Albany", explanation: "In 1797, Albany became the official capital of New York State. Since then, Albany has been a center for banking, railroads, and international trade."), // TODO: source is -- https://www.albany.org/things-to-do/albany-heritage-tourism/history/#:~:text=In%201797%2C%20Albany%20became%20the,%2C%20railroads%2C%20and%20international%20trade.
        QuestionData(id: 2, headline: "Washington, DC", question: "Is Washington, DC a state?", choices: ["Yes", "No"], answer: "No", explanation: "Washington, DC, is not a state; it's a district. DC stands for District of Columbia. Its creation comes directly from the US Constitution: which provides that the district, 'not exceeding 10 Miles square', 'would 'become the Seat of the Government of the United States'.") // TODO: source is -- https://statehood.dc.gov/page/faq#:~:text=Washington%2C%20DC%2C%20isn't,Government%20of%20the%20United%20States.%22
    ]
    
    static let testData: [QuestionData] = [
        // example question where the user answer is incorrect
        QuestionData(id: 0, headline: "Best NY Pizza Spot", question: "What is the best pizza place in NYC?", choices: ["Lucali", "Dollar pizzas everywhere", "Dominos"], answer: "Dollar pizzas everywhere", userAnswer: "Dominos", explanation: "Dollar pizzas in NYC are the best, although unhealthy. Stores that sell these types of pizzas are everywhere. They usually serve it as a combo with a choice of your beverage.", isAnswered: true, isCorrect: false),
        // example question where the user answer is correct
        QuestionData(id: 99, headline: "Most Southern City in CA", question: "What is the most southern city in California?", choices: ["Lost Angeles", "San Francisco", "San Diego"], answer: "San Diego", userAnswer: "San Diego", explanation: "Imperial Beach is located in San Diego. It is the most southwesterly city in the continental United States.", isAnswered: true, isCorrect: true),
    ]
}

var score = 0

func incrementScore() {
    score += 1;
}
