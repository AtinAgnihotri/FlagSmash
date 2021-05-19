//
//  ContentView.swift
//  FlagSmash
//
//  Created by Atin Agnihotri on 17/05/21.
//

import SwiftUI

struct ContentView: View {

    @State private var userScore = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAns = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack (spacing: 30){
                Spacer()
                VStack{
                    Text("Tap the flag of: ")
                        .font(.title)
                        .foregroundColor(.white)
                    Text(countries[correctAns])
                        .font(.title)
                        .foregroundColor(.white)
                }
                Spacer()
                ForEach(0..<3) { number in
                    Button(action: {
                        checkAnswer(number)
                    }) {
                       Image(countries[number])
                    }
                }
                Spacer()
                
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    func checkAnswer(_ userAns: Int) {
        if userAns == correctAns {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAns = Int.random(in: 0...2)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
