//
//  QuizView.swift
//  QuizApp
//
//  Created by Jane Ladaban on 6/14/23.
//

import SwiftUI

struct QuestionsView: View {
    @Binding var data: [QuestionData]
    @State var isViewProgress = false
    
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
            
            Button("View My Progress") {
                isViewProgress.toggle()
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding()
        .sheet(isPresented: $isViewProgress) {
            VStack {
                ForEach($data, id: \.self) { $data in
                    VStack {
                        HStack(alignment: .bottom) {
                            Text("Question #\(data.id):")
                            Text(data.isAnswered ? (data.isCorrect ? "Correct" : "Incorrect") : "Unanswered")
                        }
                        
                    }
                    .padding()
                }
                
                Text("Current score: \(score)")
            }
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(data: .constant(DataModel.testData))
    }
}
