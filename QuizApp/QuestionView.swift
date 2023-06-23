//
//  QuestionView.swift
//  QuizApp
//
//  Created by Jane Ladaban on 6/20/23.
//

import SwiftUI

struct QuestionView: View {
    @Binding var question: QuestionData
    @State var userAnswer: String = ""
    
    var body: some View {
        VStack {
            // show question
            Text(question.question)
                .font(.title)
            
            // show choices
            ForEach(question.choices, id: \.self) { choice in
                Button(choice) {
                    question.isAnswered.toggle() // mark question as answered
                    userAnswer = choice
                    
                    if (userAnswer == question.answer) {
                        incrementScore()
                        question.isCorrect.toggle()
                    }
                }
                .padding()
            }
            
            // show result
            if (question.isAnswered) {
                if (question.isCorrect) {
                    Text("You got it right! The correct answer is \(question.answer).")
                        .foregroundColor(.green)
                } else {
                    Text("You are incorrect. The correct answer is \(question.answer).")
                        .foregroundColor(.red)
                }
            }
        }
        .disabled(question.isAnswered) // disable once answered
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: .constant(DataModel.testData[0]))
    }
}
