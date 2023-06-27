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
                    Image(systemName: "map.circle")
                        .imageScale(.large)
                        .foregroundColor(.green)
                        .font(.largeTitle)
                    Text("USA Facts Quiz")
                        .font(.title)
                }
                
                // show CTA
                NavigationLink(destination: QuestionsView(data: $data)) {
                    Text("Let's start!")
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
