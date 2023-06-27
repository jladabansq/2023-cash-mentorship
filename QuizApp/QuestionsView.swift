//
//  QuizView.swift
//  QuizApp
//
//  Created by Jane Ladaban on 6/14/23.
//

import SwiftUI

struct QuestionsView: View {
    @Binding var data: [QuestionData]
    @State var isShowScore = false
    
    var body: some View {
        VStack {
            NavigationView {
                // show questions
                List($data, id: \.self) { $data in
                    NavigationLink(destination: QuestionView(question: $data)) {
                        HStack {
                            // show icon check/x if question is already answered
                            if (data.isAnswered) {
                                Image(systemName: (data.isCorrect) ? "checkmark.square.fill" : "x.square.fill")
                                    .foregroundColor(data.isCorrect ? .green : .red)
                            }
                            // show header
                            Text("\(data.headline)")
                        }
                    }
                    
                }
                .navigationBarTitle("Questions")
            }
            
            // show progress if all are answered
            if (answered == data.count) {
                Button("View my score") {
                    isShowScore.toggle()
                }
                .padding(.bottom, 20)
                .sheet(isPresented: $isShowScore) {
                    Text("Final score: \(score) out of \(data.capacity)")
                        .font(.title3)
                    
                    ForEach(data) { question in
                        HStack {
                            Text("Question #\(question.id): ")
                            Text(question.isCorrect ? "Correct" : "Incorrect")
                                .foregroundColor(question.isCorrect ? .green : .red)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(data: .constant(DataModel.testData))
    }
}
