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
                    // background
                    LinearGradient(gradient: Gradient(colors: [Color("cp-1"), Color("cp-2"), Color("cp-3")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                    
                    // title + CTA
                    VStack {
                        Text("🇺🇸 USA Facts Quiz")
                            .font(.largeTitle)
                            .padding(.bottom, 20)
                        
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
