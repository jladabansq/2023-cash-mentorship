//
//  QuizView.swift
//  QuizApp
//
//  Created by Jane Ladaban on 6/14/23.
//

import SwiftUI

struct QuestionsView: View {
    @Binding var data: [QuestionData]
    
    var body: some View {
        VStack {
            
            VStack {
                NavigationView {
                    // show questions
                    List($data, id: \.self) { $data in
                        NavigationLink(destination: QuestionView(question: $data)) {
                            HStack {
                                // show icon check/x if question is already answered
                                if (data.isAnswered) {
                                    Image(systemName: (data.isCorrect) ? "checkmark.circle.fill" : "x.circle.fill")
                                }
                                // show header
                                Text("\(data.headline)")
                            }
                        }
                        
                    }
                    .navigationBarTitle("Questions")
                }
                
                // show current score
                Text("Your current score is \(score)")
            }
            .navigationBarBackButtonHidden(true)
        }
        .padding()
        .background(.linearGradient(colors: [Color("CP-DarkGreen"),Color("CP-LightGreen"),Color("CP-Yellow"),Color("CP-Pink")], startPoint: .leading, endPoint: .trailing))
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(data: .constant(DataModel.testData))
    }
}
