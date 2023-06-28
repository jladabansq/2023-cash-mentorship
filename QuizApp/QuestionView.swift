//
//  QuestionView.swift
//  QuizApp
//
//  Created by Jane Ladaban on 6/20/23.
//

import SwiftUI

struct QuestionView: View {
    @Binding var question: QuestionData
    
    var body: some View {
        VStack {
            ZStack {
                // background
                LinearGradient(gradient: Gradient(colors: [Color("cp-3"), Color("cp-2"), Color("cp-1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                // everything else
                VStack {
                    // show question and choices
                    VStack {
                        Text(question.question)
                            .font(.title3)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        ForEach(question.choices, id: \.self) { choice in
                            Button(choice) {
                                question.isAnswered.toggle() // mark question as answered
                                question.userAnswer = choice
                                
                                if (question.userAnswer == question.answer) {
                                    incrementScore()
                                    question.isCorrect.toggle()
                                }
                            }
                            .bold(question.isAnswered && choice == question.answer ? true : false)
                            .padding()
                            .foregroundColor(question.isAnswered && choice == question.answer ? Color("cp-green") : .primary) // if that choice is not the correct answer, then put no background
                        }
                    }
                    .padding()
                    .border(.primary, width: 1)
                    
                    // show result if answered
                    VStack {
                        if (question.isAnswered) {
                            HStack {
                                Image(systemName: question.isCorrect ? "person.fill.checkmark" : "person.fill.xmark")
                                Text(question.isCorrect ? "You got it right!" : "\(question.userAnswer) is incorrect.")
                            }
                            .padding(.bottom, 10)
                            .foregroundColor(question.isCorrect ? Color("cp-green") : Color("cp-red"))
                            
                            ScrollView {
                                Text(question.explanation)
                                
                            }
                        }
                    }
                    .padding()
                }
            }
            
        }
        .disabled(question.isAnswered) // disable if answered
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: .constant(DataModel.testData[0]))
    }
}
