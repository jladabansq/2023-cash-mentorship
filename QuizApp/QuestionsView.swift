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
                                    .foregroundColor(data.isCorrect ? Color("cp-green") : Color("cp-red"))
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
                Button("View my final score") {
                    isShowScore.toggle()
                }
                .font(.title3)
                .padding(.bottom, 20)
                .sheet(isPresented: $isShowScore) {
                    VStack {
                        // score
                        VStack(alignment: .leading) {
                            Text("Final score: \(score) out of \(data.capacity)")
                                .font(.title3)
                                .padding(.bottom, 5)
                            
                            ForEach(data) { question in
                                Text("Question #\(question.id): ") + Text(question.isCorrect ? "Correct" : "Incorrect")
                                    .foregroundColor(question.isCorrect ? Color("cp-green") : Color("cp-red"))
                            }
                        }
                        .padding()
                        .border(.primary, width: 1)
                        
                        // remark
                        VStack(alignment: .center) {
                            if (score == data.count) {
                                Text("Congrats on the perfect score! 🎉")
                            } else if (score > (data.count/2)) {
                                Text("Not bad. 👏")
                            } else {
                                Text("Hope you learned new stuff today. 😉")
                            }
                            
                            Button("Dismiss") {
                                isShowScore = false
                            }
                            .padding(.top, 10)
                        }
                        .padding(.top, 15)
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
