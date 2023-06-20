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
        NavigationView {
            VStack {
                // show header
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("USA Facts Quiz")
                }
                
                // show CTA
                NavigationLink(destination: QuestionsView(data: $data)) {
                    Text("Let's start!")
                }
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
