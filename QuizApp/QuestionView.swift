//
//  QuestionView.swift
//  QuizApp
//
//  Created by Jane Ladaban on 6/20/23.
//

import SwiftUI

struct QuestionView: View {
    @Binding var question: QuestionData
    @State var isShowAnswer = false
    @State var userAnswer = ""
    
    var body: some View {
        VStack {
            ZStack {
                // background
                LinearGradient(gradient: Gradient(colors: [Color("cp-2"), Color("cp-3")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
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
                                answered += 1 // increment the number of answered questions
                                
                                // if the user is correct
                                if (choice == question.answer) {
                                    incrementScore()
                                    question.isCorrect.toggle()
                                }
                                
                                userAnswer = choice // mark the user's answer
                                
                                isShowAnswer.toggle() // toggle to show answer
                            }
                            .italic(question.isAnswered && choice == question.answer ? true : false)
                            .padding()
                            .foregroundColor(Color("AccentColor"))
                        }
                    }
                    .padding()
                    .border(.primary, width: 1)
                    .disabled(question.isAnswered) // disable if answered
                    .sheet(isPresented: $isShowAnswer) {
                        VStack {
                            Text(userAnswer.elementsEqual(question.answer) ? "You got it right! ✅" : "You are incorrect. The correct answer is \(question.answer).")
                                .font(.title3)
                                .padding(.bottom, 10)
                            Button("Dismiss") {
                                isShowAnswer = false
                            }
                        }
                        .padding()
                    }
                    
                    //  show result if answered
                    VStack(alignment: .center) {
                        if (question.isAnswered) {
                            HStack {
                                Image(systemName: question.isCorrect ? "person.fill.checkmark" : "person.fill.xmark")
                                Text(question.isCorrect ? "You got it right!" : "You are incorrect.")
                            }
                            .padding(.bottom, 20)
                            .foregroundColor(question.isCorrect ? Color("cp-green") : Color("cp-red"))
                            
                            VStack(alignment: .leading) {
                                Text(question.explanation)
                                    .padding(.bottom, 5)
                                Link(destination: URL(string: "\(question.source)")!, label:{
                                    Text("Read more on their site")
                                        .underline()
                                })
                            }
                        }
                    }
                    .padding()
                }
                .padding()
                .padding()
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: .constant(DataModel.testData[0]))
    }
}
