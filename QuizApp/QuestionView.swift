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
            // show question and choices
            VStack {
                Text(question.question)
                    .font(.title3)
                    .fixedSize(horizontal: false, vertical: true)
                
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
            }
            .padding()
            .border(.gray, width: 3)
            
            // show result if answered
            VStack {
                if (question.isAnswered) {
                    HStack {
                        Image(systemName: question.isCorrect ? "person.fill.checkmark" : "")
                        Text(question.isCorrect ? "You got it right!" : "You are incorrect.")
                    }
                    .padding(.bottom, 10)
                    .foregroundColor(question.isCorrect ? .green : .red)
                    
                    Text(question.explanation)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(.top, 30)
        }
        .padding()
        .disabled(question.isAnswered) // disable if answered
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: .constant(DataModel.testData[0]))
    }
}
