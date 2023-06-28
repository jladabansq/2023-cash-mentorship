//
//  ContentView.swift
//  QuizApp
//
//  Created by Jane Ladaban on 6/14/23.
//

import SwiftUI

struct ContentView: View {
    @State var data = DataModel.data;
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color("whiteish"), Color("blueish")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                    VStack {
                        // show header
                        Text("USA Facts Quiz")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        // show CTA
                        NavigationLink(destination: QuestionsView(data: $data)) {
                            Text("Start")
                                .font(.title2)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
