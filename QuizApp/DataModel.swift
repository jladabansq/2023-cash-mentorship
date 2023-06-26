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
        QuestionData(id: 0, headline: "What do you think?", question: "Do you think this is a test?", choices: ["Yes", "No", "Maybe"], answer: "Maybe", explanation: "Can be a test, or not. What else is there to say? I really just need this to be a long line. Hmm. Let's see. What else can I put in here?", isAnswered: true), // TODO: Remove isAnswered once done styling
        QuestionData(id: 99, headline: "Is it?", question: "Is this a real question?", choices: ["Yes", "No", "Maybe"], answer: "No", explanation: "This is really just a test!"),
    ]
}

var score = 0

func incrementScore() {
    score += 1;
}
